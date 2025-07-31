# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[0;32m\]\u@\h:\w\$\[\033[0m\] '

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -alh'
alias zsteg='zsteg --no-color'

alias autoremove='pacman -Qdtq | sudo pacman -Rns -'
alias libvirtd='sudo systemctl start libvirtd'
