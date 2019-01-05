#!/usr/bin/env zsh

source header.sh

read -k1 "response?${bold}This will set the default keyboard layout to Colemak in the virtual console (TTY). Continue? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  echo "${bold}${blue}localectl --no-convert set-keymap colemak${nofmt}"
  localectl --no-convert set-keymap colemak
  echo
  echo "${bold}${green}Colemak keymap configuration complete!${nofmt}"
fi
