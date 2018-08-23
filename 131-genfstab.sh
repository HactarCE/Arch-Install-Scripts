#!/usr/bin/env zsh

source header.sh

echo "${bold}${blue}genfstab /mnt >> /mnt/etc/fstab${nofmt}"
echo
genfstab /mnt >> /mnt/etc/fstab
echo
echo "${bold}${blue}genfstab${green} complete!${nofmt}"
