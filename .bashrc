# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[0;32m\][\u@\h:\w]\$\[\033[0m\] '

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias vi='nvim'

alias update='sudo pacman -Syu ; yay -aur'
alias autoremove='pacman -Qdtq | sudo pacman -Rns -'
