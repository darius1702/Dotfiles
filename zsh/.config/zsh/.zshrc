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

bindkey '^G' deactivate-region
bindkey '^H' backward-kill-word
bindkey '^W' kill-region
bindkey '^[^ ' select-in-word
bindkey '^X^_' redo

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# zoxide on M-SPC
bindkey -s '^[ ' '^A^Kcdi^M'

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Make zsh stop eating the space before a | character
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# auto insert first completion match
# setopt MENU_COMPLETE

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' on %F{green}%b'

# OSC 133 sequence to jump to prompt
precmd() {
    print -Pn "\e]133;A\e\\"
}

# Prompt
DIR=$'%F{blue}%~%f'
CHAR=$'%F{fg}%f'
# PROMPT=$'${DIR}${vcs_info_msg_0_}%6(~.\n. )${CHAR} '
PROMPT=$'${DIR}${vcs_info_msg_0_}\n${CHAR} '

# Disable C-s and C-q in interactive shells
if [[ -t 0 && $- = *i* ]]
then
  stty -ixon
fi

export EDITOR=nvim
export VISUAL=$EDITOR

export FZF_DEFAULT_OPTS="--style minimal --color fg:8,bg+:0,pointer:2,info:8,prompt:4,hl:2,hl+:2 --bind=ctrl-j:accept,ctrl-k:kill-line"
export FZF_CTRL_R_OPTS="--height 10 --layout reverse"
export _ZO_FZF_OPTS="--prompt '>> ' --height 10 --layout reverse $FZF_DEFAULT_OPTS"

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export LANG="en_US.UTF-8"
export PAGER="nvim -R"
export MANPAGER="nvim +Man! +'set cmdheight=0 laststatus=0'"
export CLICOLOR=1
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export HISTDUP=erase
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Make cmake output the compilation database
export CMAKE_EXPORT_COMPILE_COMMANDS="on"

# Quick-edit configs
alias zc="$EDITOR ~/.config/zsh/.zshrc"
alias vc="$EDITOR ~/.config/nvim/init.lua"
alias tc="$EDITOR ~/.tmux.conf"

alias todo="rg -i 'todo|fixme'"

local emacs="emacsclient -cn -a ''"
alias e=$emacs
alias vim=$emacs
alias v=$emacs
alias ts="tmux new-session -s"

alias z=zathura
# Hyprland does window swallowing
# z()
# {
#   zathura --fork $1
# }

alias cp="cp -iv"
alias mv="mv -iv"

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -Ah --color=auto"
alias ll="ls -lh --color=auto"
alias lla="ls -lAh --color=auto"

alias grep="grep --color=auto"
alias ip="ip -c"
