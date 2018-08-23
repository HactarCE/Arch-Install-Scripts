#!/usr/bin/env zsh

source header.sh

# mirror_country="United States"
#
# echo "${bold}Installing ${blue}pacman-contrib${white}..."
# echo "${blue}pacman -Sy pacman-contrib --needed${nofmt}"
# echo
# pacman -Sy pacman-contrib --needed
# echo
#
# echo "${bold}${blue}cd /etc/pacman.d${nofmt}"
# cd /etc/pacman.d
# if [ ! -f mirrorlist.bak ]; then
#   echo "${bold}Backing up mirrorlist..."
#   echo "${blue}cp mirrorlist mirrorlist.bak${nofmt}"
#   cp mirrorlist mirrorlist.bak
# fi
# echo "${bold}Selecting mirrors in ${mirror_country}..."
# echo "${blue}sed '/^$/q' mirrorlist.bak > mirrorlist${nofmt}"
# sed '/^$/q' mirrorlist.bak > mirrorlist # copy header
# echo "${bold}${blue}grep -A1 \"$mirror_country\" mirrorlist.bak | sed '/^--$d' >> mirrorlist${nofmt}"
# grep -A1 "$mirror_country" mirrorlist.bak | sed '/^--$/d' >> mirrorlist # filter by country
# echo "${bold}Ranking mirrors..."
# echo "${blue}rankmirrors -n 6 mirrorlist | tee mirrorlist${nofmt}"
# echo
# rankmirrors -n 6 mirrorlist | tee mirrorlist

echo "${bold}Updating ${blue}python${white}..."
echo "${blue}pacman -Sy python --needed${nofmt}"
echo
pacman -Sy python --needed
echo

echo "${bold}Installing ${blue}reflector${white}..."
echo "${blue}pacman -S reflector --needed${nofmt}"
echo
pacman -S reflector --needed
echo
echo "${bold}${blue}reflector -l 200 -f 20 --sort rate --save /etc/pacman.d/mirrorlist${nofmt}"
echo
reflector -l 200 -f 20 --sort rate --save /etc/pacman.d/mirrorlist

# echo
# echo "$(tput bold)Updating package databases...$(tput init)"
# echo
# pacman -Syy

echo
echo "${bold}${green}Mirrors ranked\!${nofmt}"
