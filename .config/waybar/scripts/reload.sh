#!/usr/bin/env bash

killall waybar;
pid=$(pgrep waybar)

while [ "$pid" != "" ];
do
    pid=$(pgrep waybar)
done

if [ $(pgrep "Hyprland") != "" ]; 
then
    waybar -c ~/.config/waybar/config-hypr-1 -s ~/.config/waybar/style-hypr.css &
    waybar -c ~/.config/waybar/config-hypr-2 -s ~/.config/waybar/style-hypr.css &
else
    waybar -c ~/.config/waybar/config-sway -s ~/.config/waybar/style-sway.css &
fi

swaync-client -R;
