#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

# Created by `pipx` on 2026-02-03 22:20:42
export PATH="$PATH:/home/schaarschmidt/.local/bin"
