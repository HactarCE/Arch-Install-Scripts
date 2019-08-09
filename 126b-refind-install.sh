#!/usr/bin/env zsh

source header.sh

fdisk -l
echo
echo "${bold}Installing bootloader...${nofmt}"
echo "${bold}${blue}refind-install${nofmt}"
echo
refind-install
echo
echo "${bold}${green}Bootloader installation complete!${nofmt}"

./beep.sh
