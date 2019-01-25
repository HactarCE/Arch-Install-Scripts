#!/usr/bin/env zsh

source header.sh

echo "${bold}Enabling ${blue}dhcpcd${white} (ethernet daemon)...${nofmt}"
echo "${bold}${blue}systemctl enable dhcpcd${nofmt}"
systemctl enable dhcpcd
echo
echo "${bold}${green}Done enabling ${blue}dhcpcd${green}!${nofmt}"
