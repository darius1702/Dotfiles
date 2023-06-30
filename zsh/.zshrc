source ~/.config/zsh/.zshrc

# go
export PATH="$HOME/Software/thirdparty/go/bin/:$PATH"
export PATH=~/go/bin:$PATH

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env --shell zsh`"

alias kitsrc="source $HOME/kitcar/kitcar-init/config/zshrc_private && source $HOME/kitcar/kitcar-python-utils/init/bashrc && source $HOME/kitcar/kitcar-gazebo-simulation/init/bashrc"
