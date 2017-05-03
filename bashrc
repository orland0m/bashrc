#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Alias
alias ls='ls -C -F -G'
alias la='ls -a'
alias ll='ls -la'
alias grep='grep --color=auto'
alias cls='clear;ls'
alias vim="nvim"
alias vi="nvim"
alias diff="colordiff"
alias ack="ack --color-filename=red --color-lineno=white"

# Configs: Mac OS
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Configs: Other
export PS1="\[\033[38;5;255m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;30m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;166m\]\$?\[$(tput sgr0)\]\[\033[38;5;255m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERM=xterm-256color
export PATH=$PATH:~/.opt

# Configs: rbenv
eval "$(rbenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.profile

# Configs: bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
GIT_PROMPT_END="\n\\$ \[$(tput sgr0)\]"
export __GIT_PROMPT_DIR=$CURR_DIR/sources/bash-git-prompt
source $CURR_DIR/sources/bash-git-prompt/gitprompt.sh