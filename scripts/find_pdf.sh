#!/usr/bin/env bash
find ~/Documents ~/Downloads ~/Desktop ~/Zotero ~/kitcar -type f -name "*.pdf" | rofi -dmenu -i -p "PDF:" | xargs -I{} zathura {}
