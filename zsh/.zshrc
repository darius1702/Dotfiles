source ~/.config/zsh/.zshrc

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
source <(fzf --zsh)

alias imv=imv-wayland

# alias ros1dev=" devcontainer exec --workspace-folder=/home/darius/kitcar/kitcar-ros zsh"
# alias nuc="ssh kitcar@kitcarnuc"

[ -f ~/Software/fzf-git.sh/fzf-git.sh ] && source ~/Software/fzf-git.sh/fzf-git.sh

export PATH="$HOME/.juliaup/bin:$PATH"

export PATH="$HOME/.local/bin/:$PATH"

[ -f "/home/darius/.ghcup/env" ] && . "/home/darius/.ghcup/env" # ghcup-env

eval "$(direnv hook zsh)"
