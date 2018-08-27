#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing X.Org...${nofmt}"
pacman_auto_install xorg-server xorg-apps xorg-xinit
echo "${bold}${green}X.Org installed!${nofmt}"

# TODO does this really belong here? needed for lightdm config though...
echo
read -k1 "response?${bold}Install ${yellow}numlockx${white}? ${Yn}"; echo
echo
if [[ ${response:l} != n ]]; then
  pacman_auto_install numlockx
  echo "${bold}${yellow}numlockx${white} package installation complete!${nofmt}"
fi
