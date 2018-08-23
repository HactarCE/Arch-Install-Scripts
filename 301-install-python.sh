#!/usr/bin/env zsh

source header.sh

echo "${bold}We've gotten this far without Python, but no way am I writing a shell script to install packages from a file. So Python!"
echo
echo "You can uninstall it once we're done, if you really want.${nofmt}"
echo
read -k1 "response?${bold}Install ${yellow}python${white}? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo
  echo "${bold}${blue}pacman -S python --needed"
  echo
  pacman -S python --needed
  echo
  echo "${bold}${yellow}python${green} package installed!${nofmt}"
fi
