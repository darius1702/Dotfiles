source ~/.config/zsh/.zshrc

export PATH="$HOME/.local/bin/:$PATH"

#source "$HOME/.cargo/env"

alias ghcsrc="[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env" # ghcup-env"

eval "$(zoxide init zsh --cmd cd)"

alias docker_off="sudo systemctl stop docker.socket docker.service containerd"
alias docker_on="sudo systemctl start docker containerd"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
