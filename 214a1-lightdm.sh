#!/usr/bin/env zsh

source header.sh

echo "${bold}Installing LightDM..."
echo "${blue}pacman -S ttf-ubuntu-font-family lightdm --needed${nofmt}"
echo
pacman -S ttf-ubuntu-font-family lightdm --needed
echo
echo "${bold}${green}LightDM installation mostly complete!${white} You still need a greeter. Run 214a2-lightdm-slick-greeter.sh from a ${underline}non-root${no_underline} account to install ${yellow}lightdm-slick-greeter${white}.${nofmt} (${yellow}lightdm-slick-greeter${white} is on the AUR, and ${blue}makepkg${white} doesn't like running on root accounts.)"
