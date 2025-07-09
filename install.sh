#!/bin/sh
set -xe

# rofi theme
mkdir -p ~/.local/share/rofi/themes/

# link everything
stow gitconfig
stow nvim
stow zsh
stow zathura

### Wayland ###
stow hyprland
stow foot
stow waybar
stow mako
stow iwgtk
stow rofi

echo "[!] ./iwd/main.conf belongs in /etc/iwd/main.conf"
echo "[!] ./systemd-boot/arch.conf belongs in /boot/loader/entries/ (adjust root UUID)"
