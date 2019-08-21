#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${blue}git${white}...${nofmt}"
pacman_auto_install git
echo "${bold}${blue}git pull${nofmt}"
echo
git pull
echo
echo "${bold}${green}Installation scripts updated!${nofmt}"
