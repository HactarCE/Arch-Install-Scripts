#!/usr/bin/env zsh

source header.sh

echo "${bold}This script installs the proprietary drivers for Nvidia's MX150 laptop graphics card. If you don't have this card, don't run this script.${nofmt}"
read -k1 "response?${bold}Install MX150 drivers? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  pacman_auto_install bbswitch bumblebee mesa nvidia nvidia-utils xf86-video-vesa xf86-video-intel nvidia-settings
  read "name?${bold}Enter username (for ${yellow}bumblebee${white} group): ${nofmt}"
  echo "${bold}${blue}gpasswd -a "$name" bumblebee${nofmt}"
  echo
  gpasswd -a "$name" bumblebee
  echo
  echo "${bold}${blue}systemctl enable bumblebeed.service${nofmt}"
  echo
  systemctl enable bumblebeed.service
  echo
  echo "${bold}${green}Nvidia MX150 proprietary drivers installed!${white}"
  echo "See https://wiki.archlinux.org/index.php/Bumblebee#Test for information on testing them.${nofmt}"
fi
