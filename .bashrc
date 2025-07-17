# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[0;32m\][\u@\h:\w]\$\[\033[0m\] '

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias zsteg='zsteg --no-color'

alias autoremove='pacman -Qdtq | sudo pacman -Rns -'
alias nvidia='export __NV_PRIME_RENDER_OFFLOAD=1 && export __GLX_VENDOR_LIBRARY_NAME=nvidia'
