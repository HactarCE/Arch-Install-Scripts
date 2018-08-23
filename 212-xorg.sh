#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing X.Org..."
echo "${blue}pacman -S xorg-server xorg-apps xorg-xinit --needed${white}"
echo
pacman -S xorg-server xorg-apps xorg-xinit --needed
echo
echo "${bold}${green}X.Org installed!${nofmt}"

# TODO does this really belong here? needed for lightdm config though...
echo
read -k1 "response?${bold}Install ${yellow}numlockx${white}? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}pacman -S numlockx --needed --noconfirm${nofmt}"
  echo
  pacman -S numlockx --needed --noconfirm
  echo
  echo "${bold}${yellow}xnumlock${white} package installation complete!${nofmt}"
fi
