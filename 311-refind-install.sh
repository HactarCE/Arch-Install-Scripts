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
echo "${bold}Verify that rEFInd works, and then delete Grub ${red}at your own risk${white}."

./beep.sh
