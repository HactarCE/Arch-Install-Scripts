#!/usr/bin/env zsh

source header.sh

echo "See RFC 952 for best practices regarding hostname."
echo
read "name?${bold}Enter new system hostname:${nofmt} "
echo
echo "${bold}${blue}echo ${name} > /etc/hostname${nofmt}"
echo $name > /etc/hostname
echo "${green}Hostname configuration complete!${nofmt}"
