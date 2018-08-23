#!/usr/bin/env zsh

source header

echo "${bold}${blue}mkinicpio -p linux${nofmt}"
echo
mkinitcpio -p linux
echo
echo "${bold}${blue}mkinitcpio${green} complete\!${nofmt} Well that was easy."
