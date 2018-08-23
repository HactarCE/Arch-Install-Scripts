#!/usr/bin/env zsh

source header.sh

echo "${bold}${yellow}yay${white} is an AUR wrapper written in Go. No, you should not be using ${yellow}yaourt${white}. ${yellow}yaourt${white} is bad. See ${underline}https://wiki.archlinux.org/index.php/AUR_helpers#Discontinued_or_problematic${no_underline}."
echo
echo "You can uninstall it once we're done, if you really want.${nofmt}"
echo
read -k1 "response?${bold}Install ${yellow}yay${white}? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo
  echo "${bold}${blue}pacman -S yay --needed"
  echo
  pacman -S yay --needed
  echo
  echo "${bold}${yellow}python${green} package installed\!${nofmt}"
fi
