#!/usr/bin/env zsh

source header.sh

echo "${bold}Running ${blue}pacstrap /mnt base base-devel${white}...${nofmt}"
echo
pacstrap /mnt base base-devel
echo
echo "${bold}${blue}pacstrap${green} complete!${nofmt}"

./beep.sh
