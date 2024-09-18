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

### X11 ###
stow bspwm
#stow i3
stow polybar
stow picom
stow dunst

### Wayland ###
#stow hyprland
#stow sway
#stow waybar-minimal
#stow waybar
#stow mako




echo "!!! Copy the keyboard and gpu configurations to /etc/X11/corg.conf.d/ !!!"
