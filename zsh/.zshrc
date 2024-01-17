source ~/.config/zsh/.zshrc

# go
export PATH="$HOME/Software/go/bin/:$PATH"
export PATH=~/go/bin:$PATH

alias kitsrc="source $HOME/kitcar/kitcar-init/config/zshrc_private && source $HOME/kitcar/kitcar-python-utils/init/bashrc && source $HOME/kitcar/kitcar-gazebo-simulation/init/bashrc"

export PATH="$HOME/.local/share/fnm:$PATH" && eval "`fnm env --shell zsh`"
alias ghcsrc="[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env" # ghcup-env"

source "$HOME/.cargo/env"

alias ros2="lxc exec kitcar-jammy -- sudo -iu ubuntu zsh"

eval "$(zoxide init zsh --no-cmd)"
alias cd=__zoxide_z
