source ~/.config/zsh/.zshrc

# go
export PATH="$HOME/Software/thirdparty/go/bin/:$PATH"
export PATH=~/go/bin:$PATH

alias kitsrc="source $HOME/kitcar/kitcar-init/config/zshrc_private && source $HOME/kitcar/kitcar-python-utils/init/bashrc && source $HOME/kitcar/kitcar-gazebo-simulation/init/bashrc"

alias fnmsrc='export PATH="$HOME/.local/share/fnm:$PATH" && eval "`fnm env --shell zsh`"'
alias ghcsrc="[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env" # ghcup-env"

sed -e '1,3d' ~/Notes/refile.org
