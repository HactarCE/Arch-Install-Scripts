#!/usr/bin/env zsh

source header.sh

echo "${bold}Copying scripts into ${yellow}/mnt/install-scripts${white}..."
echo "${bold}${blue}cp -r /install-scripts /mnt${nofmt}"
cp -r /install-scripts /mnt
echo
echo "${bold}${green}Done copying scripts!${nofmt} Feel free to delete ${yellow}/install-scripts${white} once the whole installation is over."
