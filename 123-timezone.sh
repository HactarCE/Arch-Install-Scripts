#!/usr/bin/env zsh

source header.sh

while true; do
  f=/usr/share/zoneinfo
  while [ ! -f "$f" ]; do
    cd $f
    unset f
    tput clear
    echo "${bold}${magenta}TIMEZONE${titlesep}${nofmt}"
    echo "${yellow}$(pwd)${white}"
    echo "${bold}Select a region/timezone${nofmt}"
    ls
    tput sc
    while [ ! -e "$f" ]; do
      [ ! -z "$f" ] && echo "${bold}${red}Invalid.${nofmt}"
      read "f?${bold}Enter the region/timezone name:${nofmt} "
      tput rc; tput ed
    done
  done
  tput clear
  echo "${bold}${magenta}TIMEZONE${titlesep}${nofmt}"
  echo "${yellow}$(pwd)/${f}${white}"
  read -k1 "response?${bold}Confirm timezone? ${Yn}"; echo
  [[ ${response:l} = n ]] || break
done
echo "${bold}Setting timezone...${nofmt}"
# sometimes /etc/localtime defaults to UTC, so we need to get rid of that first
if [ -e /etc/localtime ]; then
  echo "${bold}${blue}rm /etc/localtime${nofmt}"
  rm /etc/localtime
fi
echo "${bold}${blue}ln -s \"$(pwd)/$f\" /etc/localtime"
ln -s "$(pwd)/$f" /etc/localtime
echo "${bold}${green}Timezone configuration complete!${nofmt}"
