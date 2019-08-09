#!/usr/bin/env zsh

source header.sh

echo "${bold}This will copy ${yellow}/install-scripts/refind/*${white} into ${yellow}/boot/efi/EFI/refind${white}. If you are not the author of these scripts, ${underline}you should check what those files do before answering \"yes\" to the following prompt.${no_underline}"
echo
read -k1 "response?${bold}${underline}This will delete all existing files in ${yellow}/boot/efi/EFI/refind/themes${white} and may replace some files in ${yellow}/boot/efi/EFI/refind${white}${no_underline}. Continue? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  if [ -e /boot/efi/EFI/refind/themes ]; then
    echo "${bold}${blue}rm -rf /boot/efi/EFI/refind/themes${nofmt}"
    rm -rf /boot/efi/EFI/refind/themes
  fi
  echo "${bold}${blue}mkdir -p /boot/efi/EFI/refind/themes${nofmt}"
  mkdir -p /boot/efi/EFI/refind/themes
  echo "${bold}${blue}cp -r /install-scripts/refind/* /boot/efi/EFI/refind${nofmt}"
  cp -r /install-scripts/refind/* /boot/efi/EFI/refind
  echo
  echo "${bold}${green}rEFInd configuration complete!${nofmt}"
fi
