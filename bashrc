#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Call external config files
if [ -f  ~/.profile ]; then
    source ~/.profile
fi

# Do platform specific configs
case "$(uname -s)" in
   Darwin)
       source $CURR_DIR/bashrc.darwin
     ;;
   *)
       source $CURR_DIR/bashrc.linux
     ;;
esac

function SuggestBinary() {
    command -v $1 --help &>/dev/null || echo "WARN: $1 is missing from the system, you should install it for better bashrc integration"
}

SuggestBinary "colordiff"
SuggestBinary "ack"
SuggestBinary "nvim"
SuggestBinary "astyle"
SuggestBinary "json-diff"

# Alias
alias la='ls -a'
alias ll='ls -la'
alias grep='grep --color=auto'
alias cls='clear;ls'
alias vim="nvim"
alias vi="nvim"
alias diff="colordiff"
alias ack="ack --color-filename=red --color-lineno=white"
alias getdiff="get-diff"

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
