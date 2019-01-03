#!/usr/bin/env zsh

source header.sh

read -k1 "response?${bold}This will set the default keyboard layout to Colemak in both the virtual console (TTY) and Xorg. Continue? ${yN}"; echo
if [[ ${response:l} = y ]]; then
  layout=`localectl | grep Layout | cut -d: -f2 | cut -b2-`
  model=`localectl | grep Model | cut -d: -f2 | cut -b2-`
  echo "${bold}${blue}localectl --no-convert set-keymap colemak${nofmt}"
  localectl --no-convert set-keymap colemak
  echo "${bold}${blue}localectl --no-convert set-x11-keymap $layout $model colemak shift:both_capslock${nofmt}"
  localectl --no-convert set-x11-keymap "$layout" "$model" colemak shift:both_capslock
  echo
  echo "${bold}${green}Colemak keymap configuration complete!${white} You may have to restart before it takes effect.${nofmt}"
fi
