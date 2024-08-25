#!/bin/sh
set -xe

# rofi theme
mkdir -p ~/.local/share/rofi/themes/
cp ./squared-blue.rasi ~/.local/share/rofi/themes/

# link everything
stow Xresources
stow alacritty
stow gitconfig
stow nvim
stow tmux
stow zsh
stow rofi

# window managers
stow bspwm
#stow i3
#stow hyprland
#stow sway

# status bars
stow polybar
#stow waybar-minimal
#stow waybar

# notifications
stow dunst
#stow mako

echo "!!! Copy the keyboard and gpu configurations to /etc/X11/corg.conf.d/ !!!"
