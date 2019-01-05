#!/usr/bin/env python3

from os import path
import os
import subprocess
import sys
import termios
import tty

def run(*args, stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr, **kwargs):
    return subprocess.run(*args, stdin=stdin, stdout=stdout, stderr=stderr, **kwargs, shell=True)

def getch(allowed='', print_char=True):
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    try:
        tty.setraw(sys.stdin.fileno())
        if allowed:
            ch = None
            while not (ch and ch in allowed + '\x03'):
                ch = sys.stdin.read(1)
        else:
            ch = sys.stdin.read(1)
        if print_char:
            sys.stdout.write(ch)
            sys.stdout.flush()
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
    if ch == '\x03':
        raise KeyboardInterrupt()
    return ch

def ask_package_group(name, allow_some=True):
    print(f"Install package group '{name}'? [A{'S' if allow_some else ''}N]", end=' ')
    sys.stdout.flush()
    c = getch('anAN' + ('sS' if allow_some else '')).lower()
    print()
    return c

def install_all(pathname):
    if path.isdir(pathname):
        install_list = []
        for member in os.listdir(pathname):
            install_list += install_all(path.join(pathname, member))
        return install_list
    else:
        return [pathname]

def install_some(pathname):
    install_list = []
    for member in os.listdir(pathname):
        member_pathname = path.join(pathname, member)
        c = ask_package_group(member_pathname, path.isdir(member_pathname))
        if c == 'a':
            install_list += install_all(member_pathname)
        elif c == 's':
            install_list += install_some(member_pathname)
    return install_list

print("Updating package database...")
print()
if run('yay -Sy').returncode:
    print("Aborting...")
    exit()

print()
print("A = all")
print("S = select some")
print("N = none")
print()
install_list = install_some('packages')
print()
print("Package groups to install:")
for file in install_list:
    print(f"Install {file}")
print()
print("Confirm? [YN]", end=' ')
sys.stdout.flush()
yn = getch('ynYN').lower()
if yn == 'n':
    print("Aborting...")
    exit()

failed_files = []
for file in install_list:
    print()
    print(f"Parsing {file}...")
    package_list = []
    command_list = []
    for line in open(file):
        line = line.partition('#')[0].strip()
        if line.startswith('!'):
            command_list.append(line[1:].strip())
        else:
            package_list += line.split()
    print(f"Installing packages from {file}...")
    print()
    for package in package_list:
        deps_packages = set(check_output(['yay', '-Qqd']).decode().splitlines())
        deps_to_explicit = []
        for p in package_list:
            if p in deps_packages:
                deps_to_explicit.append(p)
        if deps_to_explicit:
            run('yay -D --asexplicit ' + ' '.join(deps_to_explicit))
    if run('yay -S --needed --noconfirm --asexplicit ' + ' '.join(package_list)).returncode:
        print()
        print("Uh oh. There was an error.")
        failed_files.append(file)
    print()
    print("Running post-install commands...")
    print()
    for command in command_list:
        print(command)
        run(command)

print()
if failed_files:
    print("The following files did not complete successfully:")
    for file in failed_files:
        print(file)
else:
    print("All packages installed successfully!")
