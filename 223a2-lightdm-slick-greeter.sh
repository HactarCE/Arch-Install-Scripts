#!/usr/bin/env zsh

source header.sh

if [[ $EUID = 0 ]]; then
  echo "${bold}${red}This script must be run from a ${underline}non-root${no_underline} account.${nofmt} (${yellow}lightdm-slick-greeter${white} is on the AUR, and ${blue}makepkg${white} doesn't like running on root accounts.)"
  return 1
fi

echo "${bold}Installing ${yellow}ubuntu-font-family${white}..."
echo
#sudo pacman_auto_install ttf-ubuntu-font-family
echo

echo "${bold}Installing ${yellow}lightdm-slick-greeter${white} from AUR..."
echo
echo "${blue}cd /tmp${nofmt}"
cd /tmp
echo "${bold}${blue}git clone https://aur.archlinux.org/lightdm-slick-greeter.git${nofmt}"
echo
git clone https://aur.archlinux.org/lightdm-slick-greeter.git
echo
echo "${bold}${blue}cd lightdm-slick-greeter${nofmt}"
echo
cd lightdm-slick-greeter
echo "${bold}${blue}makepkg -si${nofmt}"
echo
makepkg -si
echo
echo "${bold}${green}LightDM greeter installation complete!${nofmt}"
