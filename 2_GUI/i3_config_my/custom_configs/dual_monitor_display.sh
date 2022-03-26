#!/bin/bash

# direction=$(cat ~/.config/i3/config | grep "$config_str" | tail -n 1 | cut -d " " -f 3)
direction=$(cat ~/.config/i3/custom_configs/values/monitor.txt)
echo $direction

if [ -z "$1" ]; then
    a=1
else
    if [ $1 == "right" ] || [ $1 == "left" ]; then
        direction="--$1-of"
    else
        if [ $1 == "above" ] || [ $1 == "below" ]; then
            direction="--$1"
        else
            if [ $1 == "same" ]; then
                direction="--$1-as"
            else
                bash ~/.config/i3/custom_configs/dual_monitor_display.sh
            fi
        fi
    fi
fi

#if [ -z "$direction" ] || [ -z "$(xrandr | grep 'HDMI-0 connected primary')" ]; then
if [ -z "$direction" ] || [ -z "$(xrandr | grep 'HDMI-0 connected')" ]; then
    a=1
else
    cmd_1="echo $direction > ~/.config/i3/custom_configs/values/monitor.txt"
    cmd_2="xrandr --output HDMI-0 --auto $direction eDP-1-1 --mode 1920x1080 --rate 144"
    eval "$cmd_1"
    eval "$cmd_2"
fi

