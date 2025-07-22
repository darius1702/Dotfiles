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

# Make zsh stop eating the space before a | character
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# auto insert first completion match
# setopt MENU_COMPLETE

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' %F{white}on %B%b'

# OSC 133 sequence to jump to prompt
precmd() {
    print -Pn "\e]133;A\e\\"
}

# Prompt
PROMPT='%F{red}[%n]%f %F{magenta}%B%~%b%f %# '

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Disable C-s and C-q in interactive shells
if [[ -t 0 && $- = *i* ]]
then
  stty -ixon
fi

export EDITOR=nvim
export VISUAL=$EDITOR

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

alias vim=nvim
alias v=nvim
alias e=emacs

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
