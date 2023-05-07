source ~/.config/zsh/.zshrc

# go
export PATH="$HOME/Software/thirdparty/go/bin/:$PATH"
export PATH=~/go/bin:$PATH

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env --shell zsh`"
