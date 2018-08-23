#!/usr/bin/env zsh

source header.sh

echo "${bold}This will copy ${yellow}/install-scripts/lightdm-conf.d/*${white} into ${yellow}/etc/lightdm/lightdm.conf.d${white}. If you are not the author of these scripts, ${underline}you should check what those files do before answering \"yes\" to the following prompt.${no_underline}"
echo
read -k1 "response?${bold}${underline}This will delete all existing files in ${yellow}/etc/lightdm/lightdm.conf.d${white}${no_underline}. Continue? ${Yn}"

if [[ ${response:l} != n ]]; then
  echo
  if [ -e /etc/lightdm/lightdm.conf.d ]; then
    echo "${bold}${blue}rm -rf /etc/lightdm/lightdm.conf.d${nofmt}"
    rm -rf /etc/lightdm/lightdm.conf.d
  fi
  echo "${bold}${blue}mkdir -p /etc/lightdm/lightdm.conf.d${nofmt}"
  mkdir -p /etc/lightdm/lightdm.conf.d
  echo "${bold}${blue}cp /install-scripts/lightdm-conf.d/* /etc/lightdm/lightdm.conf.d${nofmt}"
  cp /install-scripts/lightdm-conf.d/* /etc/lightdm/lightdm.conf.d
  echo
  echo "${bold}${green}LightDM configuration complete\!${nofmt}"
fi
