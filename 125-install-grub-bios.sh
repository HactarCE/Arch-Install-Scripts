#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${yellow}grub-bios${white}..."
pacman_auto_install grub-bios
echo "${bold}${yellow}grub-bios${green} package installation complete!${white} Grub has not necessarily been installed yet."
read -k1 "response?${bold}${blue}Install ${yellow}efibootmgr${white} for EFI support? ${Yn}"; echo
echo
if [[ ${response:l} != n ]]; then
  pacman_auto_install efibootmgr
  echo "${bold}${yellow}efibootmgr${green} package installation complete!${white} Grub has not necessarily been installed yet."
fi
read -k1 "response?${bold}${blue}Install ${yellow}os-prober${white} for dual-boot support with other operating systems? ${Yn}"; echo
echo
if [[ ${response:l} != n ]]; then
  pacman_auto_install os-prober
  echo "${bold}${yellow}os-prober${green} package installation complete!${white} Grub has not necessarily been installed yet."
  echo
  echo "Once you've booted into your new Arch installation, run ${blue}os-prober${white} and ${blue}129-grub-mkconfig.sh${white}."
fi
