#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -laht --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;4m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"

alias tmux="TERM=screen-256color-bce tmux"
export EDITOR=nvim

