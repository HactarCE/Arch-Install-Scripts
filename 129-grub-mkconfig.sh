#!/usr/bin/env zsh

source header

echo "${bold}${blue}grub-mkconfig -o /boot/grub/grub.cfg${nofmt}"
echo
grub-mkconfig -o /boot/grub/grub.cfg
echo
echo "${bold}${blue}grub-mkconfig${green} complete\!"
