#!/usr/bin/env zsh

source header.sh

echo "${bold}${blue}pacman -Syy${nofmt}"
echo
pacman -Syy
echo
echo "${bold}Installing/updating ${blue}python${white} and ${blue}reflector${white}...${nofmt}"
pacman_auto_install python reflector
echo "${bold}(This will probably take a while.)"
echo "${blue}reflector -l 200 -f 20 --sort rate --save /etc/pacman.d/mirrorlist${nofmt}"
echo
reflector -l 200 -f 20 --sort rate --save /etc/pacman.d/mirrorlist
echo
echo "${bold}${green}Mirrors ranked!${nofmt}"

./beep.sh
