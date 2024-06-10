autoload -U colors && colors
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt no_list_ambiguous
setopt auto_cd
setopt prompt_subst
setopt globdots
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
unsetopt PROMPT_SP

# Emacs keybindings
bindkey -e

# Use space bar in normal mode to edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '^H' backward-kill-word
bindkey -s '^@' '^A^Kcdi^M'

# auto insert first completion match
# setopt MENU_COMPLETE

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{fg} on %B%F{blue}%b'

# Prompt variables
DIR=$'%B%F{green}%3~%b'
CHAR=$'%B%F{cyan}%(!.#.::)%f%b '
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
export HISTDUP=erase
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE


# Make cmake output the compilation database
export CMAKE_EXPORT_COMPILE_COMMANDS="on"

# Quick-edit configs
alias zc="nvim ~/.config/zsh/.zshrc"
alias vc="nvim ~/.config/nvim/lua/config/lazy.lua"
alias tc="nvim ~/.tmux.conf"

alias todo="rg -i 'todo|fixme'"

alias vim=nvim
alias v=nvim
alias e="emacsclient --no-wait -c"
alias ts="tmux new-session -s"
alias z=zathura

alias cp="cp -iv"
alias mv="mv -iv"

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -Ah --color=auto"
alias ll="ls -lh --color=auto"
alias lla="ls -lAh --color=auto"

alias grep="grep --color=auto"
