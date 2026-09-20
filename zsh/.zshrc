typeset -U PATH path

export PATH="$HOME/.local/bin/:$PATH"

if [[ $TERM == "dumb" ]]; then
  unsetopt zle
  PS1='$ '
  return
fi

source ~/.config/zsh/.zshrc

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Node.js version manager
[ -f "/usr/bin/fnm" ] && eval $(fnm env)

# Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# OCaml
# path=(${path:#$HOME/.opam/*/bin}) # clean old opam path

[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null

# Scala
export PATH="$PATH:$HOME/.local/share/coursier/bin"

# Ruby
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.4.0/bin"

# Riscv
export RISCV="/opt/riscv"
export PATH="$RISCV/bin/:$PATH"

# Icecc
export PATH="/usr/lib/icecream/bin/:$PATH"
alias is="icecream-sundae -s 192.168.2.51"
alias im="icemon -s 192.168.2.51"

# OpenVPN
alias fzivpn="sudo openvpn /etc/openvpn/client/fzi.ovpn"
alias kitvpn="sudo openvpn /etc/openvpn/client/kit.ovpn"

# Direnv
[ -f "/usr/bin/direnv" ] && eval "$(direnv hook zsh)"

# Autosuggestions
[ -d "$HOME/Dotfiles/zsh/.config/zsh/zsh-autosuggestions/" ] && source $HOME/Dotfiles/zsh/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
[ -f "/usr/bin/fzf" ] && source <(fzf --zsh)
# we only want C-r, bind C-t and M-c back to the defaults
bindkey -M emacs '^T' transpose-chars
bindkey -M emacs '\ec' capitalize-word

# cd database
[ -f "/usr/bin/zoxide" ] && eval "$(zoxide init zsh --cmd cd)"
# jump with M-SPC
bindkey -s '^[ ' '^A^Kcdi^M'
