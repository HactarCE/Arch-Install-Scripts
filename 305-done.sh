#!/usr/bin/env zsh

source header.sh

echo "${bold}Congratulations! You've finished installing Arch Linux!"
echo
echo "I'd recommend double-checking that all of these things work:"
echo "audio (builtin, jack, bluetooth, HDMI; should run at startup)"
echo "backlight"
echo "bluetooth"
echo "compton (no tearing/freezing/flickering/etc.)"
echo "graphics drivers"
echo "hibernate"
echo "network manager"
echo "power manager (should run at startup)"
echo "suspend/hibernate on lid close"
echo "swapfile or swap partition${nofmt}"
