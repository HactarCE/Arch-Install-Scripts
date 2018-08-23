#!/usr/bin/env zsh

source header.sh

echo "${bold}Use ${blue}cfdisk${white} and ${blue}mkfs${white} to arrange and format partitions as needed. Use ${blue}mount /dev/sd${cyan}XN${blue} /mnt${white} to mount the root directory, and similar commands for other partitions. (e.g. ${blue}mount /dev/sd${cyan}XN${blue} /mnt/home${white})"
echo
echo "If you're using UEFI, ensure you've made an EFI system partition (512 MiB recommended, type FAT32) and mounted it at ${blue}/mnt/boot/efi${white}."
echo
echo "Use ${blue}swapon /dev/sd${cyan}XN${white} to enable a swap partition.${nofmt}"
