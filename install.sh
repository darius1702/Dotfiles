#!/bin/sh
set -xe

# zsh better vi mode
[ -d ./zsh/.config/zsh/zsh-vi-mode ] && echo "[INFO] zsh-vi-mode was cloned already, skipping..." || git clone https://github.com/jeffreytse/zsh-vi-mode.git ./zsh/.config/zsh/zsh-vi-mode

# link everything
stow alacritty
stow dunst
stow gitconfig
stow i3
stow nvim
stow polybar
stow tmux
stow zsh

# scripts
[ -d ~/.local/bin ] || mkdir ~/.local/bin
[ -e ~/.local/bin/tmux_neorg ] || ln -sf ~/Dotfiles/scripts/tmux_neorg.sh ~/.local/bin/tmux_neorg
