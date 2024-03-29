#!/usr/bin/env bash

# swayidle timeout 5 'hyprctl dispatch dpms off' \
#          resume 'hyprctl dispatch dpms on' &

swayidle timeout 5 'hyprctl dispatch exec systemctl suspend' &
pid=$!
swaylock -e -F -i ~/Documents/Wall/wall103.jpg -s fill
kill $pid
