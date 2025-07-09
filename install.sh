#!/bin/sh
set -xe

# Rofi themes will stow to here
mkdir -p ~/.local/share/rofi/themes/

### Misc ###
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
stow rofi       # rofi-wayland package on Arch
stow satty

stow systemd
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service

echo "[!] ./iwd/main.conf belongs in /etc/iwd/main.conf"
echo "[!] ./systemd-boot/arch.conf belongs in /boot/loader/entries/ (adjust root UUID)"
