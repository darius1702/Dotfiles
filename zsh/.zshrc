source ~/.config/zsh/.zshrc

export PATH="$HOME/.local/bin/:$PATH"

source "$HOME/.cargo/env"

ghcsrc () {
  [ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env"
}

fnmsrc () {
  eval $(fnm env)
}

eval "$(zoxide init zsh --cmd cd)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
