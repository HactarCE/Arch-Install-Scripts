#!/usr/bin/env python3

from os import path
import os
import subprocess
import sys
import termios
import tty

def tput(*args):
    return subprocess.check_output(['tput'] + list(args)).decode()

BOLD    = tput('bold')
NOFMT   = tput('sgr0')
RED     = tput('setaf', '1')
GREEN   = tput('setaf', '2')
YELLOW  = tput('setaf', '3')
BLUE    = tput('setaf', '4')
MAGENTA = tput('setaf', '5')
CYAN    = tput('setaf', '6')
WHITE   = tput('setaf', '7')

def loud_log(*args, sep=' ', **kwargs):
    print(f"{BOLD}{CYAN}========={WHITE}   {sep.join(args)}{NOFMT}", **kwargs)

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
    loud_log(f"Install package group '{name}'? [A{'S' if allow_some else ''}N]", end=' ')
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

loud_log("Updating existing packages...")
print()
if run('yay').returncode:
    loud_log("Aborting...")
    exit()

print()
loud_log("A = all")
loud_log("S = select some")
loud_log("N = none")
print()
install_list = install_some('packages')
print()
loud_log("Package groups to install:")
for file in install_list:
    loud_log(f"Install {file}")
print()
loud_log("Confirm? [YN]", end=' ')
sys.stdout.flush()
yn = getch('ynYN').lower()
if yn == 'n':
    loud_log("Aborting...")
    exit()

failed_files = []
for file in install_list:
    print()
    loud_log(f"Parsing {file}...")
    package_list = []
    command_list = []
    for line in open(file):
        line = line.partition('#')[0].strip()
        if line.startswith('!'):
            command_list.append(line[1:].strip())
        else:
            package_list += line.split()
    loud_log(f"Installing packages from {file}...")
    print()
    to_install = []
    to_mark_as_explicit = []
    installed_packages = set(subprocess.check_output(['yay', '-Qq']).decode().splitlines())
    deps_packages = set(subprocess.check_output(['yay', '-Qqd']).decode().splitlines())
    for package in package_list:
        if package in deps_packages:
            to_mark_as_explicit.append(package)
        elif package not in installed_packages:
            to_install.append(package)
    if to_mark_as_explicit:
        loud_log("Marking packages as explicit:", ' '.join(to_mark_as_explicit))
        run('yay -D --asexplicit ' + ' '.join(to_mark_as_explicit))
    if to_install:
        loud_log("Installing packages:", ' '.join(to_install))
        yaycmd = 'yay -S --needed --asexplicit ' + ' '.join(to_install)
        if '--noconfirm' in sys.argv[1:]:
            yaycmd += ' --noconfirm'
        if run(yaycmd).returncode:
            print()
            loud_log("Uh oh. There was an error.")
            failed_files.append(file)
    else:
        loud_log(f"All packages from {file} are already installed.")
    print()
    loud_log("Running post-install commands...")
    print()
    for command in command_list:
        print(command)
        run(command)

print()
if failed_files:
    loud_log("The following files did not complete successfully:")
    for file in failed_files:
        print(file)
else:
    loud_log("All packages installed successfully!")
