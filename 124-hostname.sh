#!/usr/bin/env zsh

source header.sh

echo "See RFC 952 for best practices regarding hostname."
echo
# while true; do
  read "name?${bold}Enter new system hostname:${nofmt} "
  # read -k1 "response?${bold}Set system hostname to ${yellow}${name}${white}? ${Yn}"
  # [[ ${response:l} = n ]] || break
# done
echo
echo "${bold}${blue}echo ${name} > /etc/hostname${nofmt}"
echo $name > /etc/hostname
echo "${green}Hostname configuration complete\!${nofmt}"
