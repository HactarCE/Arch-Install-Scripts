#!/usr/bin/env zsh

source header.sh

echo "${bold}If you want to use a desktop environment or window manager other than i3wm, install it yourself.${nofmt}"
read -k1 "response?Install i3wm? ${Yn}"
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}pacman -S i3-gaps --needed${nofmt}"
  echo
  pacman -S i3-gaps --needed
  echo
  echo "${bold}${green}i3wm installation complete\!${nofmt}"

  echo
  read -k1 "response?${bold}Install ${yellow}dmenu${white}, ${yellow}i3lock${white}, and ${yellow}i3status${white}? ${Yn}"
  if [[ ${response:l} != n ]]; then
    echo "${bold}${blue}pacman -S dmenu i3lock i3status --needed${nofmt}"
    echo
    pacman -S dmenu i3lock i3status --needed
    echo
    echo "${bold}${green}i3wm accessory installation complete\!${nofmt}"
  fi
fi
