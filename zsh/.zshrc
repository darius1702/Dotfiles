autoload -U colors && colors
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt no_list_ambiguous
setopt auto_cd
setopt prompt_subst
unsetopt PROMPT_SP
# setopt MENU_COMPLETE   # auto insert first completion match

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '[%b] '

# Prompt variables
DIR=$'%B%F{green}%3~%b'
CHAR='%F{white}%(!.#.$)%f '
# CHAR=$'%F{white}%(!.#.\u232a)%f'

# Single-line prompt
PROMPT=$'${DIR} %F{yellow}${vcs_info_msg_0_}%f${CHAR}'

# Multi-line prompt
# PROMPT=$'\u256d ${DIR} %F{yellow}${vcs_info_msg_0_}%f\n\u2570\u2500 ${CHAR}'

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# No vim bindings in zsh
bindkey -e

export LANG="en_US.UTF-8"
export PAGER="nvim -R"
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export CLICOLOR=1
export HISTFILE="$HOME/.config/zsh/.zsh_history"

# Quick-edit configs
alias zc="vim ~/.config/zsh/.zshrc"
alias vc="vim ~/.config/nvim/init.vim"
alias fv="fzf | xargs nvim"

FZF="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias fzf=$FZF
alias ne="nort list | $FZF | xargs $HOME/Library/Python/3.8/bin/nort edit"
alias vim=nvim
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

gui() {
    # Remember to update this
    selection=$(echo "everforest\\nedge\\ngruvbox_material\\nnordfox" | \fzf --prompt='colors: ' --reverse --height 20%)

    # In case fzf returns '' because of <C-c> etc.
    [ -z $selection ] && selection='everforest'

    # In-place sed heresy
    sed -i '' "s/colors: \*.*$/colors: \*${selection}/" $HOME/.config/alacritty/alacritty.yml
}

# No underline under filenames in syntax highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Syntax highlighting
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
