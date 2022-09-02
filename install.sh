#!/bin/sh

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./zsh/.config/zsh/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode.git ./zsh/.config/zsh/zsh-vi-mode

# tpm
git clone https://github.com/tmux-plugins/tpm ./tmux/.tmux/plugins/tpm

# link everything
stow */
