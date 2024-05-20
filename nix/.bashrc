bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'
bind 'TAB: menu-complete'
bind 'set colored-completion-prefix on'
bind 'set colored-stats on'

alias vim=nvim
alias v=nvim

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -Ah --color=auto"
alias ll="ls -lh --color=auto"
alias lla="ls -lAh --color=auto"

source "$(fzf-share)/key-bindings.bash"
source "$(fzf-share)/completion.bash"

eval "$(zoxide init bash --cmd cd)"

source /run/current-system/sw/share/git/contrib/completion/git-prompt.sh

PS1='\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]$(__git_ps1) \$\[\033[0m\] '
