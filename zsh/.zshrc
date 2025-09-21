source ~/.config/zsh/.zshrc

# cd database
[ -f "/usr/bin/zoxide" ] && eval "$(zoxide init zsh --cmd cd)"

# fzf
[ -f "/usr/bin/fzf" ] && source <(fzf --zsh)
# we only want C-r, bind C-t and M-c back to the defaults
bindkey -M emacs '^T' transpose-chars
bindkey -M emacs '\ec' capitalize-word

export PATH="$HOME/.local/bin/:$PATH"

alias is="icecream-sundae -s 192.168.2.51"
