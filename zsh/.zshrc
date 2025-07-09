source ~/.config/zsh/.zshrc

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Node.js version manager
[ -f "/usr/bin/fnm" ] && eval $(fnm env)

# Haskell
[ -f "/home/darius/.ghcup/env" ] && source "/home/darius/.ghcup/env"

# OCaml
[[ ! -r /home/darius/.opam/opam-init/init.zsh ]] || source /home/darius/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# cd database
[ -f "/usr/bin/zoxide" ] && eval "$(zoxide init zsh --cmd cd)"

# fzf
[ -f "/usr/bin/fzf" ] && source <(fzf --zsh)

export PATH="$HOME/.juliaup/bin:$PATH"

export PATH="$HOME/.local/bin/:$PATH"

export PATH="/opt/Jetbrains/Toolbox/scripts/:$PATH"

export PATH="/opt/zig/:$PATH"

export PATH="$PATH:$HOME/.local/share/coursier/bin" # scala

export PATH="$PATH:$HOME/.local/share/gem/ruby/3.4.0/bin" # ruby gems

[ -f "/home/darius/.ghcup/env" ] && . "/home/darius/.ghcup/env"

[ -f "/usr/bin/direnv" ] && eval "$(direnv hook zsh)"

export RISCV="/opt/riscv"
export PATH="$RISCV/bin/:$PATH"

export PATH="/usr/lib/icecream/bin/:$PATH"
alias is="icecream-sundae -s 192.168.2.51"

alias fzivpn="sudo openvpn /etc/openvpn/client/fzi.ovpn"
alias kitvpn="sudo openvpn /etc/openvpn/client/kit.ovpn"
