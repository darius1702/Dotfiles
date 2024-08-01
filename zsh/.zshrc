source ~/.config/zsh/.zshrc

export PATH="$HOME/.local/bin/:$PATH"

# Rust tools
source "$HOME/.cargo/env"

# NodeJS
eval $(fnm env)

# Haskell
[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env"

# OCaml
[[ ! -r /home/darius/.opam/opam-init/init.zsh ]] || source /home/darius/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# cd database
eval "$(zoxide init zsh --cmd cd)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias imv=imv-x11

alias ros1dev=" devcontainer exec --workspace-folder=/home/darius/kitcar/kitcar-ros zsh"
alias nuc="ssh kitcar@kitcarnuc"
