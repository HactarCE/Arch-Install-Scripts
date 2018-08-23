#!/usr/bin/env zsh

source header.sh

echo "${bold}If your computer supports WiFi, you'll probably want to be able to use ${blue}wifi-menu${white} once you boot in."
echo "Although ${blue}wifi-menu${white} has already been installed on your system by ${blue}pacstrap${white}, it requires the ${yellow}dialog${white} and ${yellow}wpa_supplicant${white} packages, which probably have not been installed.${nofmt}"
read -k1 "response?${bold}Install ${yellow}dialog and wpa_supplicant${white}? ${Yn}"
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}arch-chroot /mnt pacman -S dialog wpa_supplicant --needed --noconfirm${nofmt}"
  arch-chroot /mnt pacman -S dialog wpa_supplicant --needed --noconfirm
  echo
  echo "${bold}${yellow}dialog${greeen} and ${yellow}wpa_supplicant${greeen} package installation complete\!${nofmt}"
fi
