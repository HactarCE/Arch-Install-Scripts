#!/usr/bin/env zsh

source header.sh

unset username
while [ -z $username ]; do
  read "username?${bold}New username:${nofmt} "
done
echo $username > /install-scripts/username.txt
echo

unset shell_path
echo "${bold}Enter the new user's default shell.${nofmt} ${yellow}/bin/bash${white} is recommended, but ${yellow}/bin/zsh${white} is also available."
while [ ! -x "$shell_path" ]; do
  read "shell_path?${bold}Default shell:${nofmt} "
  [ ! -x "$shell_path" ] && echo "${bold}${red}Not an executable file.${nofmt} Seriously, don't expect me to double-check everything."
done
echo

read -k1 "response?${bold}Add new user ${yellow}${username}${white} with ${yellow}${shell_path}${white} as default shell? ${Yn}"; echo
if [[ ${response:l} != n ]]; then
  echo "${bold}${blue}useradd -m -g users -s ${shell_path} ${username}${nofmt}"
  useradd -m -g users -s "$shell_path" "$username"
  echo "${bold}${blue}passwd ${username}${nofmt}"
  echo
  passwd "${username}"
  echo
  read -k1 "response?${bold}Run ${blue}chfn${white} to set user information (e.g. Name, Office, Office Phone, Home Phone) ${yN}"; echo
  if [[ ${response:l} = y ]]; then
    echo "${bold}${blue}chfn ${username}${nofmt}"
    echo
    chfn "$username"
    echo
  fi
  read -k1 "response?${bold}Allow ${username} to use ${blue}sudo${white} to run commands as root? ${Yn}"; echo
  if [[ ${response:l} != n ]]; then
    echo "${bold}Okay, you're on your own for this one. I'm going to run ${blue}visudo${white}, and you'll have to add the following one line under the \"User privelage specification\" section:"
    echo "${yellow}${user} ALL=(ALL) ALL${white}"
    echo "There should be a similar line for the ${yellow}root${white} user."
    echo "Good luck!"
    any_key_continue()
    EDITOR=nano visudo
    echo "${bold}I'm just going to trust that you did that correctly. If you don't feel confident, you can always run ${blue}visudo${white}manually."
    echo
  fi
  echo "${bold}${green}User setup complete!${nofmt} You can run this script multiple times to set up multiple users."
fi
