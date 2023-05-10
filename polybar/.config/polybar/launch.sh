#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

docked=false
for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  [ "$monitor" != "eDP" ] && docked=true
done

# Launch bar(s)
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
[ $docked = true ] && polybar left 2>&1 | tee -a /tmp/polybar1.log & disown
[ $docked = true ] && polybar right 2>&1 | tee -a /tmp/polybar1.log & disown
