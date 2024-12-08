#!/bin/sh
set -xe

# rofi theme
mkdir -p ~/.local/share/rofi/themes/
cp ./squared-blue.rasi ~/.local/share/rofi/themes/
cp ./win11_light.rasi ~/.local/share/rofi/themes/

# link everything
stow Xresources
stow alacritty
stow gitconfig
stow nvim
stow tmux
stow zsh
stow rofi
stow zathura

### X11 ###
#stow bspwm
#stow i3
#stow polybar
#stow picom
#stow dunst

### Wayland ###
stow hyprland
#stow sway
#stow hikari
stow waybar
stow mako
stow iwgtk


echo "[!] Copy the keyboard and gpu configurations to /etc/X11/corg.conf.d/"
echo "[!] ./iwd/main.conf belongs in /etc/iwd/main.conf"
echo "[!] ./systemd-boot/arch.conf belongs in /boot/loader/entries/ (adjust root UUID)"
