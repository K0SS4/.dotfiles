#!/usr/bin/env bash

if [[ $(pgrep -x "waybar") != "" ]];
then
killall waybar
waybar --config ~/.config/waybar/config > /dev/null 2>&1 &
elif [[ $(pgrep -x "waybar") = "" ]];
then
waybar --config ~/.config/waybar/config > /dev/null 2>&1 &
fi

swaymsg reload;
