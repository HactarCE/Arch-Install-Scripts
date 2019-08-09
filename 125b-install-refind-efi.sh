#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${yellow}refind-efi${white}..."
pacman_auto_install refind-efi
echo "${bold}${yellow}refind-efi${green} package installation complete!${white} rEFInd has not necessarily been installed yet."
read -k1 "response?${bold}${blue}Install ${yellow}efibootmgr${white} for EFI support? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  pacman_auto_install efibootmgr
  echo "${bold}${yellow}efibootmgr${green} package installation complete!${white} rEFInd has not necessarily been installed yet."
fi
