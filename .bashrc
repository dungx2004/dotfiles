#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias nv='nvim'

PS1='\[\033[0;32m\]\u\[\033[0;32m\]@\[\033[0;32m\]\h:\[\033[0;32m\]\w\[\033[0;32m\]\$\[\033[0m\] '
