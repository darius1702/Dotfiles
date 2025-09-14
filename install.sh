#!/bin/sh
set -xe

### Misc ###
stow gitconfig
stow nvim
stow zsh
stow zathura

### Wayland ###
stow hyprland
stow waybar
stow iwgtk
stow satty

# dnkl stack
stow foot
stow fnott
stow fuzzel

stow systemd
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service

[ -d "$HOME/Dotfiles/zsh/zsh-autosuggestions/" ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/Dotfiles/zsh/zsh-autosuggestions

echo "[!] ./iwd/main.conf belongs in /etc/iwd/main.conf"
echo "[!] ./systemd-boot/arch.conf belongs in /boot/loader/entries/ (adjust root UUID)"
echo "[!] move ./root files to /root"
echo "[!] remember to install cliphist"
