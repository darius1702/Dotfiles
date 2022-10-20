autoload -U colors && colors
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt no_list_ambiguous
setopt auto_cd
setopt prompt_subst
setopt globdots
unsetopt PROMPT_SP
# setopt MENU_COMPLETE   # auto insert first completion match

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%F{white} on %B%F{magenta}%b'

# Prompt variables
DIR=$'%B%F{cyan}%3~%b'
CHAR=$'%F{green}%(!.#.\u276f)%f '
# CHAR=$'%F{white}%(!.#.\u232a)%f'

# Single-line prompt
PROMPT=$'${DIR}${vcs_info_msg_0_}%b%f ${CHAR}'

# Multi-line prompt
# PROMPT=$'${DIR}${vcs_info_msg_0_}%b%f\n${CHAR}'

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# vi-mode (Disabled in favor of the vi-mode plugin below)
# bindkey -v

export LANG="en_US.UTF-8"
export PAGER="nvim -R"
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export CLICOLOR=1
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Quick-edit configs
alias zc="nvim ~/.config/zsh/.zshrc"
alias vc="nvim ~/.config/nvim/init.vim"
alias tc="nvim ~/.tmux.conf"
alias fv="fzf | xargs nvim"
alias ww="nvim ~/Documents/Notes/index.md"

function ne {
    f="$(ls $HOME/Documents/Notes | fzf --reverse --height 40% --preview "cat $HOME/Documents/Notes/{}")"
    p="$HOME/Documents/Notes/${f}"
    [ -z $f ] || nvim $p
}

function nn {
    p="$HOME/Documents/Notes/$1.md"
    [ -z $1 ] && echo "no filename given" || nvim $p
    [ -z $1 ] || echo "[$1]($1.md)" >> "$HOME/Documents/Notes/index.md"
}

alias vim=nvim
alias ts="tmux new-session -s"
alias gui="alacritty-themes" # requires github.com/rajasegar/alacritty-themes

alias pip=pip3
alias python=python3
alias py=python3
alias gcm="git commit -m"
alias find="fd"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="exa "
alias l="exa "
alias la="exa -a"
alias ll="exa --git -l --no-user"
alias lla="exa --git -la --no-user"
alias ltr="exa --git -lT"
alias latr="exa --git -laT"

# mkdir and cd, duh
function cdir {
  mkdir -p $1
  cd $1
}

# No underline under filenames in syntax highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Better vi-mode
source $HOME/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Syntax highlighting
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
