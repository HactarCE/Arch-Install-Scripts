#!/usr/bin/env zsh

source header.sh

echo "${bold}Pacman settings are stored in ${yellow}/etc/pacman.conf${white}."
echo
echo "To enable ${yellow}multilib${white} repositories, uncomment the whole ${yellow}[multilib]${white} section and run ${blue}pacman -Syy${white}."
echo "To enable color by default, uncomment the ${yellow}Color${white} line in the ${yellow}[options]${white} section."
echo
echo "Good luck!${nofmt}"
