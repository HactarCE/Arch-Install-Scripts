#!/usr/bin/env zsh

source header.sh

echo "${bold}${blue}grub-mkconfig -o /boot/grub/grub.cfg${nofmt}"
echo
grub-mkconfig -o /boot/grub/grub.cfg
echo
echo "${bold}${blue}grub-mkconfig${green} complete\!"
