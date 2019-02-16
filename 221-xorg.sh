#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing X.Org...${nofmt}"
pacman_auto_install -y xorg-server xorg-apps xorg-xinit
echo "${bold}${green}X.Org installed!${nofmt}"

echo "${bold}Copy ${yellow}/install-scripts/etc/xorg.conf.d/*${white} into ${yellow}/etc/X11/xorg.conf.d${white}. If you are not the author of these scripts, ${underline}you should check what those files do before answering \"yes\" to the following prompt.${no_underline}"
echo
read -k1 "response?${bold}${underline}This may replace some files in ${yellow}/etc/X11/xorg.conf.d/${white}${no_underline}. Continue? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}cp -r /install-scripts/etc/xorg.conf.d/* /etc/X11/xorg.conf.d${nofmt}"
  cp -r /install-scripts/etc/xorg.conf.d/* /etc/X11/xorg.conf.d
  echo
  echo "${bold}${green}XOrg configuration complete!${nofmt}"
fi

echo
echo "${bold}Manually copy one of the ${jellow}xorg.conf${white} files from ${yellow}/install-scripts/etc${white} into ${yellow}/etc${white}."
