#!/bin/sh
set -e

# zsh better vi mode
[ -d ./zsh/.config/zsh/zsh-vi-mode ] && echo "[INFO] zsh-vi-mode was cloned already, skipping..." || git clone https://github.com/jeffreytse/zsh-vi-mode.git ./zsh/.config/zsh/zsh-vi-mode

# link everything
stow alacritty
stow dunst
stow gitconfig
stow i3
stow nvim
stow tmux
stow zsh

# scripts
[ -d ~/.local/bin ] || mkdir ~/.local/bin
[ -e ~/.local/bin/socials ] || ln -sf ~/Dotfiles/scripts/socials.sh ~/.local/bin/socials
