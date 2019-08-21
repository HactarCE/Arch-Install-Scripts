#!/usr/bin/env zsh

source header.sh

echo "${bold}This script installs the open source drivers for any integrated or discrete Intel graphics. If you don't have Intel graphics, don't run this script.${nofmt}"
read -k1 "response?${bold}Install Intel graphics drivers? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  pacman_auto_install xf86-video-intel
  echo "${bold}${green}Intel open source graphics drivers installed!${white}"
fi
