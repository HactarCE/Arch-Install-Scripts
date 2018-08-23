#!/usr/bin/env zsh

source header.sh

read -k1 "response?${bold}Use only ${yellow}en_US${white} locale? ${yN}"
echo
if [[ ${response:l} = y ]]; then
  # If we matched whitespace between the comment and en_US, then the example at
  # the top of the line would be uncommented, which isn't necessarily bad, but
  # is a little awkward. (The i3 Manjaro installer I used actually makes this
  # very mistake.)
  echo "${bold}${blue}sed -i 's/^#en_US/en_US/g' /etc/locale.gen${nofmt}"
  sed -i 's/^#en_US/en_US/g' /etc/locale.gen
else
  echo "${bold}Uncomment the locales you want to use. Use ctrl-w to search for the one you want.${nofmt}"
  read -sk1 "?(Press any key to continue and run ${blue}nano /etc/locale.gen${white}.)"
  nano /etc/locale.gen
fi
echo
echo "${bold}${blue}locale-gen${nofmt}"
echo
locale-gen
echo
echo "${bold}${green}Locale configuration complete\!${nofmt}"
