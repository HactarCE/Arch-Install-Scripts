#!/usr/bin/env zsh

source header.sh

fdisk -l
echo
read "device?${bold}Enter device name for bootloader installation (e.g. ${yellow}/dev/sda${white}):${nofmt} "
read -k1 "reponse?${bold}Install bootloader on ${yellow}${device}${white}? ${yN}"
if [[ ${response:l} != y ]]; then
  echo "${bold}${red}Aborting...${nofmt}"
  return 1
fi
echo "${bold}Installing bootloader on ${yellow}${device}${white}...${nofmt}"
echo "(I've gotten errors on this command sometimes, so if something happens, ${bold}don't panic${nofmt}. Keep calm and Google on.)"
echo "${bold}${blue}grub-install ${device}${nofmt}"
echo
grub-install $device
echo
echo "${bold}${green}Bootloader installation complete\!${nofmt}"
