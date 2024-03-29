autoload -U colors && colors
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt no_list_ambiguous
setopt auto_cd
setopt prompt_subst
setopt globdots
unsetopt PROMPT_SP

# Emacs keybindings
bindkey -e

# Use space bar in normal mode to edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '^H' backward-kill-word
bindkey -s '^@' 'cdi^M'

# auto insert first completion match
# setopt MENU_COMPLETE

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{fg} on %B%F{magenta}%b'

# Prompt variables
DIR=$'%B%F{cyan}%3~%b'
# CHAR=$'%F{green}%(!.#.\u276f)%f '
CHAR=$'%B%F{green}%(!.#.::)%f%b '
PROMPT=$'${DIR}${vcs_info_msg_0_}%b%f ${CHAR}'

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Disable C-s and C-q in interactive shells
if [[ -t 0 && $- = *i* ]]
then
  stty -ixon
fi

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export LANG="en_US.UTF-8"
export PAGER="nvim -R"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export CLICOLOR=1
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Quick-edit configs
alias zc="nvim ~/.config/zsh/.zshrc"
alias vc="nvim ~/.config/nvim/lua/config/lazy.lua"
alias tc="nvim ~/.tmux.conf"
alias ic="nvim ~/.config/i3/config"

alias fv="fzf | xargs nvim"
fcd() {
  cd "$(fd --type d --no-ignore | fzf)"
}
fch() {
  cd "$(fd --type d --no-ignore --hidden | fzf)"
}

alias "..."="cd ../.."

alias todo="rg -i 'todo|fixme'"

alias vim=nvim
alias v=nvim
alias e="emacsclient --no-wait -c"
alias ts="tmux new-session -s"
alias z=zathura

alias gcm="git commit -m"
alias cp="cp -iv"
alias mv="mv -iv"

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -Ah --color=auto"
alias ll="ls -lh --color=auto"
alias lla="ls -lAh --color=auto"

alias grep="grep --color=auto"
alias catkin_make="catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1"

# Better vi-mode
# source $HOME/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
