#!/usr/bin/env python3

from os import path
import os
import subprocess
import sys
import termios
import tty

def run(*args, **kwargs):
    return subprocess.run(*args, stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr, **kwargs, shell=True)

def getch(allowed='', print_char=True):
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    try:
        tty.setraw(sys.stdin.fileno())
        if ch:
            while ch not in allowed + '\x03':
                ch = sys.stdin.read(1)
        else:
            ch = sys.stdin.read(1)
        if print_char:
            sys.stdout.write(ch)
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
    if ch == '\x03':
        raise KeyboardInterrupt()
    return ch

def ask_package_group(name, allow_some=True):
    print(f"Install package group '{name}'? [A{'S' if allow_some else ''}N]", end='')
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
        c = ask_package_group(pathname, path.isdir(member_pathname))
        if c == 'a':
            install_list += install_all(member_pathname)
        elif c == 's':
            install_list += install_some(member_pathname)
    return install_list

print("Updating package database...")
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
print("Confirm? [YN] ")
yn = getch('ynYN').lower()
if yn == 'n':
    print("Aborting...")
    exit()

print()
print("Getting package list...")
package_list = []
command_list = []
for file in install_list:
    print(f"Parsing {file}...")
    for line in open(file):
        line = line.partition('#')[0].strip()
        if line.startswith('!'):
            command_list.append(line[1:].strip())
        else:
            package_list += line.split()
print("Done getting package list.")
print()
print("Installing packages...")
print()
run('yay -S ' + ' '.join(package_list))
print()
print("Running post-install commands...")
for command in command_list:
    print(command)
    run(command)
