#!/usr/bin/env bash

swww init &
swww img ~/Documents/Wall/wall63.jpg &

nm-applet --indicator &

waybar &
swayidle before-sleep 'swaylock -e -F -i ~/Documents/Wall/wall103.jpg -s fill' timeout 5 notify-send aaaa &

mako

