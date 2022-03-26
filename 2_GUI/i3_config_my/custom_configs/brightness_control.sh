#!/bin/bash

max_brightness=1
#eval 'echo "$(xrandr --verbose)" > ~/brudnopis.txt'
current_brightness=$(xrandr --verbose | grep -A 10 'eDP-1-1 connected' | grep Brightness | cut -d ' ' -f 2)
desired_brightness=$current_brightness
    
if [ -z "$1" ]; then
    a=1
else
    if [ "$1" == "up" ]; then
        condition=$(python3 -c "print($current_brightness < $max_brightness)")
        if [ $condition == "True" ]; then
            desired_brightness=$(python3 -c "print(($current_brightness*100 + 10)/100)")
        fi
    elif [ "$1" == "down" ]; then
        condition=$(python3 -c "print(0 < $current_brightness)")
        if [ $condition == "True" ]; then
            desired_brightness=$(python3 -c "print(($current_brightness*100 - 10)/100)")
        fi
    fi
fi

cmd="xrandr --output eDP-1-1 --brightness $desired_brightness"
eval "$cmd"
echo "Brightness: $desired_brightness"
