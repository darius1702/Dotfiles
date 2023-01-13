#!/bin/sh

# zsh better vi mode
git clone https://github.com/jeffreytse/zsh-vi-mode.git ./zsh/.config/zsh/zsh-vi-mode

# tpm
git clone https://github.com/tmux-plugins/tpm ./tmux/.tmux/plugins/tpm

# link everything
stow */
