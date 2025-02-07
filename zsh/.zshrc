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

export PATH="/opt/Jetbrains/Toolbox/scripts/:$PATH"

export PATH="/opt/zig/:$PATH"


[ -f "/home/darius/.ghcup/env" ] && . "/home/darius/.ghcup/env" # ghcup-env

eval "$(direnv hook zsh)"

export RISCV="/opt/riscv"
export PATH="$RISCV/multilib-noRVC/bin/:$PATH"

export PATH="/usr/lib/icecream/bin/:$PATH"
alias is="icecream-sundae -s 192.168.2.100"
