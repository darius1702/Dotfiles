#!/usr/bin/env bash
fd . ~/Documents/Books --type f | rofi -dmenu -i -p "Book:" -l 20 | xargs -I{} zathura {}
