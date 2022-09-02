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
# PROMPT=$'\n${DIR}${vcs_info_msg_0_}%b%f\n${CHAR}'

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

# Quick-edit configs
alias zc="vim ~/.config/zsh/.zshrc"
alias vc="vim ~/.config/nvim/init.vim"
alias tc="vim ~/.tmux.conf"
alias fv="fzf | xargs nvim"

function ne {
    f="$(ls $HOME/Documents/Notes | fzf --reverse --height 40% --preview "cat $HOME/Documents/Notes/{}")"
    p="$HOME/Documents/Notes/${f}"
    [ -z $f ] || nvim $p
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
alias ltr="exa --git -laT"

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
