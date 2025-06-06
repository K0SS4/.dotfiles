#!/usr/bin/env bash

killall waybar;
pid=$(pgrep waybar)

while [ "$pid" != "" ];
do
    pid=$(pgrep waybar)
done

if [ $(pgrep "Hyprland") != "" ]; 
then
    uwsm app -- waybar -c ~/.config/waybar/config-hypr-1 -s ~/.config/waybar/style-hypr.css &
    uwsm app -- waybar -c ~/.config/waybar/config-hypr-2 -s ~/.config/waybar/style-hypr.css &
else
    uwsm app -- waybar -c ~/.config/waybar/config-sway -s ~/.config/waybar/style-sway.css &
fi

uwsm app -- swaync-client -R;
