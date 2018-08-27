#!/usr/bin/env zsh

source header.sh

echo "${bold}If you want to use a desktop environment or window manager other than i3wm, install it yourself.${nofmt}"
read -k1 "response?Install ${blue}i3-gaps${white}? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  pacman_auto_install i3-gaps
  echo "${bold}${green}i3wm installation complete!${nofmt}"
  echo
  read -k1 "response?${bold}Install ${yellow}dmenu${white}, ${yellow}i3lock${white}, and ${yellow}i3status${white}? ${Yn}"; echo
  echo
  if [[ ${response:l} != n ]]; then
    pacman_auto_install dmenu i3lock i3status
    echo "${bold}${green}i3wm accessory installation complete!${nofmt}"
  fi
fi
