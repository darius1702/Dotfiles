#!/bin/sh

set -e
# zsh better vi mode
[ -d ./zsh/.config/zsh/zsh-vi-mode ] && echo "[INFO] zsh-vi-mode was cloned already, skipping..." || git clone https://github.com/jeffreytse/zsh-vi-mode.git ./zsh/.config/zsh/zsh-vi-mode

# tpm
[ -d ./tmux/.tmux/plugins/tpm ] && echo "[INFO] tpm was cloned already, skipping..." || git clone https://github.com/tmux-plugins/tpm ./tmux/.tmux/plugins/tpm

# link everything
stow */
