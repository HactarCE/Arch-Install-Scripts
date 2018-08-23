#!/usr/bin/env zsh

source header.sh

echo "${bold}This script installs the proprietary drivers for Nvidia's 150MX laptop graphics card. If you don't have this card, don't run this script.${nofmt}"
read -k1 "response?${bold}Install MX150 drivers? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  echo "${bold}${blue}pacman -S bumblebee mesa nvidia xf86-video-intel --needed${nofmt}"
  echo
  pacman -S bumblebee mesa nvidia xf86-video-intel --needed
  echo
  read "name?${bold}Enter username (for ${yellow}bumblebee${nofmt} group): ${nofmt}"
  echo "${bold}${blue}gpasswd -a "$name" bumblebee${nofmt}"
  echo
  gpasswd -a "$name" bumblebee
  echo
  echo "${bold}${blue}systemctl enable bumblebeed.service${nofmt}"
  echo
  systemctl enable bumblebeed.service
fi
