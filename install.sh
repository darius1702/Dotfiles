#!/bin/sh
set -xe

# rofi theme
mkdir -p ~/.local/share/rofi/themes/
cp ./squared-blue.rasi ~/.local/share/rofi/themes/

# link everything
stow alacritty
#stow dunst
stow gitconfig
#stow i3
stow nvim
#stow polybar
stow tmux
stow zsh
stow hyprland
stow waybar
stow rofi
