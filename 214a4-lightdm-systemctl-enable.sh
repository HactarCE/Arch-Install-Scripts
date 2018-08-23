#!/usr/bin/env zsh

source header.sh

echo "${bold}Enabling LightDM service..."
echo "${blue}systemctl enable lightdm${nofmt}"
echo
systemctl enable lightdm
echo
echo "${bold}${green}LightDM service enabled!${nofmt}"
