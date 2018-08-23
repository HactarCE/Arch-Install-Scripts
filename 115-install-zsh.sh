#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing ${blue}zsh${white} on the new system...${nofmt}"
echo "(You can uninstall it later if you really want to.)"
echo "${bold}${blue}arch-chroot /mnt pacman -S zsh --needed --noconfirm${nofmt}"
echo
arch-chroot /mnt pacman -S zsh --needed --noconfirm
echo
echo "${bold}${yellow}zsh${green} package installation complete!${nofmt}"
