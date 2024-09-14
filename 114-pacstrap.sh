#!/usr/bin/env zsh

source header.sh

echo "${bold}Running ${blue}pacstrap /mnt base linux linux-firmware${white}...${nofmt}"
echo
pacstrap /mnt base linux linux-firmware
echo
echo "${bold}${blue}pacstrap${green} complete!${nofmt}"

./beep.sh
