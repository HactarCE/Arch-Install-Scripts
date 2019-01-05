#!/usr/bin/env zsh

source header.sh

echo "${bold}This script installs the proprietary drivers for Nvidia's GeForce 750 Ti laptop graphics card. If you don't have this card, don't run this script.${nofmt}"
read -k1 "response?${bold}Install GeForce 750 Ti drivers? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  pacman_auto_install mesa nvidia nvidia-utils nvidia-settings
  echo "${bold}${green}Nvidia GeForce 750 Ti proprietary drivers installed!${white}"
fi
