#!/usr/bin/env bash

# Wallpaper
swaybg -i ~/Documents/Wall/wall117.jpg -m fill &

iwgtk -i &
blueman-applet &

waybar &
# swayidle before-sleep 'swaylock -e -F -i ~/Documents/Wall/wall103.jpg -s fill' timeout 5 notify-send aaaa &

mako
