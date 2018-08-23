#!/usr/bin/env zsh

source header.sh

echo "${bold}Unmounting ${yellow}/mnt${white}..."
echo "${blue}umount -R /mnt${nofmt}"
echo
umount -R /mnt
echo
echo "${bold}${yellow}/mnt${white} unmounted!${nofmt}"
