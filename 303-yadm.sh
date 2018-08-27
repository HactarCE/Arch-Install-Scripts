#!/usr/bin/env zsh

source header.sh

pacman_auto_install yadm
echo "${bold}${blue}cd $HOME${nofmt}"
cd $HOME
echo
read "gh_user?${bold}Enter GitHub username:${nofmt} "
read "gh_repo?${bold}Enter dotfiles repo name:${nofmt} "
echo "${bold}${blue}yadm clone https://github.com/${gh_user}/${gh_repo}.git${nofmt}"
echo
yadm clone https://github.com/${gh_user}/${gh_repo}.git
echo
read "yadm_class?${bold}Enter Yadm class:${nofmt} "
echo "${bold}${blue}yadm config local.class $yadm_class${nofmt}"
yadm config local.class $yadm_class
echo
echo "${bold}${blue}yadm status${nofmt}"
echo
yadm status
echo
echo "${bold}${green}Yadm setup complete!${nofmt}"
