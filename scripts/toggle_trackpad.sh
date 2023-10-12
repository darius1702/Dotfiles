#!/bin/sh

id=$(xinput list | grep Touchpad | awk  '{print $6}' | sed "s/id=//")
state=$(xinput list-props "$id" | grep "Device Enabled" | grep -o "[01]$")

if [ $state = "1" ]
then
  xinput --disable $id
  notify-send "Disabled trackpad"
else
  xinput --enable $id
  notify-send "Enabled trackpad"
fi
