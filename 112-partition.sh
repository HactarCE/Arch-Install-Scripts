#!/usr/bin/env zsh

source header

echo "${bold}Use ${blue}cfdisk${white} and ${blue}mkfs${white} to arrange and format partitions as needed. Use ${blue}mount /dev/sd${cyan}X${blue} /mnt${white} to mount the root directory, and similar commands for other partitions. (e.g. ${blue}mount /dev/sd${cyan}X${blue} /mnt/home${white})"
echo
echo "Use ${blue}swapon /dev/sd${cyan}XN${white} to enable a swap partition.${nofmt}"
