#!/usr/bin/env zsh

source header.sh

# echo "${bold}The working directory MUST be the same as the directory of this script."
# read -k1 "response?Is this script in ${yellow}$(pwd)${white}? ${Yn}"; echo
# if [[ ${response:l} = n ]]; then
#   echo "${bold}${red}Aborting...${nofmt}"
#   return 1
# fi
# echo
echo "${bold}Copying scripts into ${yellow}/mnt/install-scripts${white}..."
# echo "${blue}mkdir -p /mnt/install-scripts${nofmt}"
# mkdir -p /mnt/install-scripts
# echo "${bold}${blue}cp * /mnt/install-scripts${nofmt}"
# cp * /mnt/install-scripts
echo "${bold}${blue}cp -r /install-scripts /mnt${nofmt}"
cp -r /install-scripts /mnt
echo
echo "${bold}${green}Done copying scripts!${nofmt} Feel free to delete ${yellow}/install-scripts${white} once the whole installation is over."
