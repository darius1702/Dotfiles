#!/usr/bin/env bash

swayidle timeout 5 'swaymsg exec systemctl suspend' &
pid=$!
gtklock -b ~/Documents/Wall/wall14.JPG
kill $pid
