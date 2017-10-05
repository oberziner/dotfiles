# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#LS aliases
alias ll='ls -l'

#Colored ls on both Mac and Linux
if ls --help 2>&1 | grep -q -- --color
then
    alias ls='ls --color=auto -F'
else
    alias ls='ls -FG'
fi

#Load git completion on Mac
if [[ $OSTYPE == darwin* ]]
then
    source ~/.git-completion.bash
fi

#git aliases
alias gs='git status'
alias ga='git add -i'
alias gd='git diff'
alias gdc='git diff --cached'

#Bash history configs
#Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=1000000
export HISTSIZE=1000000
#When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

#Changes prompt string
PS1='[\u@\h \W]\$ '
