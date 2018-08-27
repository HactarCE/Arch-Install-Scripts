#!/usr/bin/env zsh

source header.sh

echo "${bold}If you'd like, you can use ${blue}efibootmgr${white} to change the default EFI boot order:"
echo
echo "List boot entries:"
echo "${blue}efibootmgr -v${white}"
echo
echo "Modify an entry's label by deleting and recreating it."
echo "If the existing entry has a ${yellow}FILE${white} parameter:"
echo "${blue}efibootmgr -b 2 -B"
echo "efibootmgr -c -d ${cyan}/dev/sdX${blue} -p ${cyan}Y${blue} -L \"Arch Linux\" -l \"${cyan}EFI\folder\file.efi${blue}\" -v${white}"
echo "... where ${cyan}/dev/sdX${white} and ${cyan}Y${white} are the drive letter and partition number respectively where ${yellow}/boot${white} is located."
echo "... and ${cyan}EFI\folder\file.efi${white} is the path to the EFI file, which can be read from ${blue}efibootmgr -v${white} ${underline}before${no_underline} deleting the partition."
echo "Otherwise:"
echo "${blue}efibootmgr -b 2 -B"
echo "efibootmgr -c -d ${cyan}/dev/sdX${blue} -p ${cyan}Y${blue} -L \"Arch Linux\" -l /vmlinuz-linux -u 'root=PARTUUID=${cyan}XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX${blue} rw initrd=\initramfs-linux.img' -v${white}"
echo "... where ${cyan}/dev/sdX${white} and ${cyan}Y${white} are the drive letter and partition number respectively where ${yellow}/boot${white} is located."
echo "... and ${cyan}XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX${white} is the partition UUID, which can be read from ${blue}efibootmgr -v${white} ${underline}before${no_underline} deleting the partition or from ${blue}blkid${white}."
echo
echo "Change boot order:"
echo "Apparently it's possible to do this from ${blue}efibootmgr${white}, but I've had more success with just doing it in the BIOS settings. You're on your own for this one."
echo
echo "Good luck!${nofmt}"
