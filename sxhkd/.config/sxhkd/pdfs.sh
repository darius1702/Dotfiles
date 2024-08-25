#!/bin/sh

find ~/Documents ~/Downloads ~/Desktop ~/Zotero ~/kitcar -type f -name "*.pdf" | dmenu -i -p "PDF:" -l 20 | xargs -I{} zathura {}
