#!/usr/bin/env zsh

source header.sh

echo "Running ${blue}passwd${white}...${nofmt}"
passwd
echo
echo "${bold}${green}Root password set\!${nofmt}"
