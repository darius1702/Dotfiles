source ~/.config/zsh/.zshrc

export PATH="$HOME/.local/bin/:$PATH"

# go
export PATH="$HOME/Software/go/bin/:$PATH"
export PATH=~/go/bin:$PATH

#source "$HOME/.cargo/env"

#alias kitsrc="source $HOME/kitcar/kitcar-init/config/zshrc_private && source $HOME/kitcar/kitcar-python-utils/init/bashrc && source $HOME/kitcar/kitcar-gazebo-simulation/init/bashrc"

#export PATH="$HOME/.local/share/fnm:$PATH" && eval "`fnm env --shell zsh`"
alias ghcsrc="[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env" # ghcup-env"

#eval "$(zoxide init zsh --cmd cd)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias docker_off="sudo systemctl stop docker.socket docker.service containerd"
alias docker_on="sudo systemctl start docker containerd"
