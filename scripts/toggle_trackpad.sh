#!/bin/sh

id=14
state=$(xinput list-props "$id" | grep "Device Enabled" | grep -o "[01]$")

if [ $state = "1" ]
then
  xinput --disable $id
  notify-send "Disabled trackpad"
else
  xinput --enable $id
  notify-send "Enabled trackpad"
fi
