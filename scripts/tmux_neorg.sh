#!/bin/sh

tmux has-session -t neorg >/dev/null 2>&1 && tmux attach -t neorg || tmux new-session -s neorg nvim +"lua require('neorg').setup{}" +"Neorg workspace notes"
