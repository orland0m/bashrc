#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Alias
alias la='ls -a'
alias ll='ls -la'
alias grep='grep --color=auto'
alias cls='clear;ls'
alias vim="nvim"
alias vi="nvim"
alias diff="colordiff"
alias ack="ag"
alias ag="ag --color-line-number \"6;33;49\" --color-match \"6;31;49\" --color-path \"7;97;49\""
alias getdiff="get-diff"
alias ssh-init="ssh-add ~/.ssh/id_rsa"

# Configs: Other
export PS1="\[\033[38;5;255m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;30m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;166m\]\$?\[$(tput sgr0)\]\[\033[38;5;255m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERM=xterm-256color
export PATH=$PATH:$CURR_DIR/opt

# Configs: rbenv
rbenv --help &>/dev/null && eval "$(rbenv init -)"

# Configs: bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
GIT_PROMPT_END="\n\\$ \[$(tput sgr0)\]"
export __GIT_PROMPT_DIR=$CURR_DIR/sources/bash-git-prompt
source $CURR_DIR/sources/bash-git-prompt/gitprompt.sh

# Configs: platform specific
case "$(uname -s)" in
   Darwin)
       source $CURR_DIR/bashrc.darwin
     ;;
   *)
       source $CURR_DIR/bashrc.linux
     ;;
esac

if [ "$SSH_CONNECTION" ]; then
    source $CURR_DIR/bashrc.ssh
fi

eval "$(ssh-agent -s)" &>/dev/null

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
