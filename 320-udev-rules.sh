#!/usr/bin/env zsh

source header.sh

echo "${bold}This will copy ${yellow}/install-scripts/etc/udev/rules.d/*${white} into ${yellow}/etc/udev/rules.d${white}. If you are not the author of these scripts, ${underline}you should check what those files do before answering \"yes\" to the following prompt.${no_underline}"
echo
read -k1 "response?${bold}${underline}This will delete all existing files in ${yellow}/etc/udev/rules.d${white}. Continue? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  if [ -e /etc/udev/rules.d ]; then
    echo "${bold}${blue}rm -rf /etc/udev/rules.d${nofmt}"
    sudo rm -rf /etc/udev/rules.d
  fi
  echo "${bold}${blue}mkdir -p /etc/udev/rules.d${nofmt}"
  sudo mkdir -p /etc/udev/rules.d
  echo "${bold}${blue}cp -r /install-scripts/etc/udev/rules.d/* /etc/udev/rules.d${nofmt}"
  sudo cp -r /install-scripts/etc/udev/rules.d/* /etc/udev/rules.d
  echo
  echo "${bold}${green}LightDM configuration complete!${nofmt}"
fi
