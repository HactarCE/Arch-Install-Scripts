#!/usr/bin/env zsh

source header.sh

echo "${bold}Linux graphics drivers are crazy complicated, so I'm not doing this for you. If you want the open-source drivers, use one of these commands:"
echo "AMD:    ${yellow}pacman -S xf86-video-amdgpu --needed${white}"
echo "Intel:  ${yellow}pacman -S xf86-video-intel --needed${white}"
echo "Nvidia: ${yellow}pacman -S xf86-video-noveau --needed${white}"
echo
echo "If you aren't sure what to do here, install ${yellow}xf86-video-vesa${white} for now and you'll at least be able to run the display server."
echo "${blue}pacman -S xf64-video-vesa --needed${white}"
echo
echo "For proprietary drivers or anything else, the Arch Wiki is invaluable."
echo "${underline}https://wiki.archlinux.org/index.php/xorg#Driver_installation${no_underline}"
echo
echo "Good luck!${nofmt}"
