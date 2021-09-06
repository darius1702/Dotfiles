autoload -U colors && colors
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt no_list_ambiguous
setopt auto_cd
setopt prompt_subst
unsetopt PROMPT_SP
#setopt MENU_COMPLETE   # auto insert first completion match

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '[%b] '

PROMPT=$'%B%F{#98C379}%3~%b %F{#E5C07B}${vcs_info_msg_0_}%F{#ABB2BF}%(!.#.\u232a)%f'

# Make Shift-Tab go to previous completion suggestion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

export LANG="en_US.UTF-8"
export PAGER=most
export EDITOR=nvim
export CLICOLOR=1
export HISTFILE="$HOME/.config/zsh/.zsh_history"

alias zc="vim ~/.config/zsh/.zshrc"
alias vc="vim ~/.config/nvim/init.vim"

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
alias G="git"

function cdir {
  mkdir -p $1
  cd $1
}

function nord {
  # call when onedark is selected to switch to nord
  [ -f ~/.config/alacritty/nord.yml ] \
  && \mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/onedark.yml \
  && \mv ~/.config/alacritty/nord.yml ~/.config/alacritty/alacritty.yml \
  || echo "Already on nord"
}

function onedark {
  # call when nord is selected to switch to onedark
  [ -f ~/.config/alacritty/onedark.yml ] \
  && \mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/nord.yml \
  && \mv ~/.config/alacritty/onedark.yml ~/.config/alacritty/alacritty.yml \
  || echo "Already on onedark"
}

# macOS yaa
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/openjdk-16.0.1/Contents/Home"

# No underline under filenames in syntax highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
