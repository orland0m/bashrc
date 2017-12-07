#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "#!/bin/bash\n\
\n\
source $CURR_DIR/bashrc\n" > ~/.bashrc

pushd $CURR_DIR/sources/powerline_fonts
./install.sh
popd

function SuggestBinary() {
    command -v $1 --help &>/dev/null || echo "WARN: $1 is missing from the system, you should install it for better bashrc integration"
}

SuggestBinary "colordiff"
SuggestBinary "ack"
SuggestBinary "nvim"
SuggestBinary "astyle"
SuggestBinary "json-diff"
SuggestBinary "npm"

hash git &>/dev/null && git config --global core.excludesfile ~/.bash_runtime/config/git/gitignore_global

# Mate only configs
mate-terminal --help &>/dev/null

if [ $? -eq 0 ]; then
    pushd $CURR_DIR/sources/solarized-mate-terminal
    bash solarized-mate.sh
    popd
fi
