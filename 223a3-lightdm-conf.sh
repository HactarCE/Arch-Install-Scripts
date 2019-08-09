#!/usr/bin/env zsh

source header.sh

echo "${bold}This will copy ${yellow}/install-scripts/etc/lightdm/*${white} into ${yellow}/etc/lightdm${white}. If you are not the author of these scripts, ${underline}you should check what those files do before answering \"yes\" to the following prompt.${no_underline}"
echo
read -k1 "response?${bold}${underline}This will delete all existing files in ${yellow}/etc/lightdm/lightdm.conf.d${white} and may replace some files in ${yellow}/etc/lightdm${white}${no_underline}. Continue? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  if [ -e /etc/lightdm/lightdm.conf.d ]; then
    echo "${bold}${blue}rm -rf /etc/lightdm/lightdm.conf.d${nofmt}"
    rm -rf /etc/lightdm/lightdm.conf.d
  fi
  echo "${bold}${blue}mkdir -p /etc/lightdm/lightdm.conf.d${nofmt}"
  mkdir -p /etc/lightdm/lightdm.conf.d
  echo "${bold}${blue}cp -r /install-scripts/etc/lightdm/* /etc/lightdm${nofmt}"
  cp -r /install-scripts/etc/lightdm/* /etc/lightdm
  echo
  echo "${bold}${green}LightDM configuration complete!${nofmt}"
fi
