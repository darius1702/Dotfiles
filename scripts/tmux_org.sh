#!/bin/sh

tmux has-session -t org >/dev/null 2>&1 && tmux attach -t org || tmux new-session -s org nvim ~/Notes/index.org
