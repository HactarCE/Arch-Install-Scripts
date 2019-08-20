#!/usr/bin/env zsh

source header.sh

pacman_auto_install systemd-swap
echo "${bold}${blue}sudo sed -i 's/swapfc_enabled=0/swapfc_enabled=1/' /etc/systemd/swap.conf${nofmt}"
sed -i 's/swapfc_enabled=0/swapfc_enabled=1/' /etc/systemd/swap.conf

echo "${bold}${green}Swapfile enabled!${nofmt}"
