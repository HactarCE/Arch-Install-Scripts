#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${yellow}grub-bios${white}..."
echo "${blue}pacman -S grub-bios --needed --noconfirm${nofmt}"
echo
pacman -S grub-bios --needed --noconfirm
echo
echo "${bold}${yellow}grub-bios${green} package installation complete!${white} Grub has not necessarily been installed yet."
read -k1 "response?${bold}${blue}Install ${yellow}efibootmgr${white} for EFI support? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}pacman -S efibootmgr --needed --noconfirm${nofmt}"
  echo
  pacman -S efibootmgr --needed --noconfirm
  echo
  echo "${bold}${yellow}efibootmgr${green} package installation complete!${white} Grub has not necessarily been installed yet."
fi
read -k1 "response?${bold}${blue}Install ${yellow}os-prober${white} for dual-boot support with other operating systems? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}pacman -S os-prober --needed --noconfirm${nofmt}"
  echo
  pacman -S os-prober --needed --noconfirm
  echo
  echo "${bold}${yellow}os-prober${green} package installation complete!${white} Grub has not necessarily been installed yet."
  echo
  echo "${bold}Here's the output from ${blue}os-prober${white}:${nofmt}"
  echo
  os-prober
  echo
  echo "${bold}Hopefully it found your other operating systems. If you haven't installed the other OSes yet, re-run ${blue}129-grub-mkconfig.sh${white} after you do."
  echo
  echo "I've had issues before with running ${blue}os-prober${white} from the live USB, so if you get an error, try it again after rebooting.${nofmt}"
fi
