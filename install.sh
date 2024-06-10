#!/bin/sh
set -xe

# rofi theme
mkdir -p ~/.local/share/rofi/themes/
cp ./squared-blue.rasi ~/.local/share/rofi/themes/

# link everything
stow alacritty
#stow dunst
stow gitconfig
stow nvim
stow tmux
stow zsh
#stow i3
#stow hyprland
stow sway
#stow rofi
#stow polybar
stow waybar-minimal
#stow waybar
