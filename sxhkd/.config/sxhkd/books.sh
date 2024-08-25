#!/bin/sh

fdfind . ~/Documents/Books --type f | dmenu -i -p "Book:" -l 20 | xargs -I{} zathura {}
