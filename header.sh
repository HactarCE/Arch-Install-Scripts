#!/usr/bin/env zsh

set -e

bold=$(tput bold)
nofmt=$(tput sgr0)
underline=$(tput smul)
no_underline=$(tput rmul)

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

titlesep="\n-------------------------------------------------------------------------------\n"

any_key_continue () {
  read -sk1 "?Press any key to continue."; echo
}

check_connection () {
  if ping -w1 -c1 8.8.8.8; then
    echo
    echo "${bold}${green}Connected!${nofmt}"
  else
    echo "${bold}${red}Unable to connect.${white} Check ethernet connection or use ${blue}wifi-menu${white} to connect to wifi.${nofmt}"
  fi
}

pacman_auto_install () {
  echo "${bold}${blue}sudo pacman -S $*$ --needed --noconfirm{nofmt}"
  echo
  sudo pacman -S "$@" --needed --noconfirm
  ./beep.sh
  echo
}

Yn=" [${green}Y${white}/${red}n${white}]${nofmt} "
yN=" [${green}y${white}/${red}N${white}]${nofmt} "
