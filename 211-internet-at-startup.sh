#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${yellow}ifplugd${white} and ${yellow}wpa_actiond${white}..."
echo
pacman_auto_install ifplugd wpa_actiond
echo "${bold}Searching for network interfaces using ${blue}ip link show${white}...${nofmt}"
echo
interfaces=`ip link show | cut -d: -f2 | cut -b2-`
echo $interfaces | grep '^wl' | while read -r interface; do
  echo "${bold}${blue}systemctl enable \"netctl-auto@${interface}.service${nofmt}\""
  systemctl enable "netctl-auto@${interface}.service${nofmt}"
done
echo $interfaces | grep '^en' | while read -r interface; do
  echo "${bold}${blue}systemctl enable \"netctl-ifplugd@${interface}.service${nofmt}\""
  systemctl enable "netctl-ifplugd@${interface}.service${nofmt}"
done
echo
echo "${bold}${green}WiFi and ethernet should now work automatically at startup!${nofmt}"
