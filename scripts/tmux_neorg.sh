#!/bin/sh

tmux has-session -t neorg >/dev/null 2>&1 && tmux attach -t neorg || tmux new-session -s neorg nvim +"Neorg workspace notes" +"set conceallevel=3"
