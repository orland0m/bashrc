#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Mate only configs
mate-terminal --help &>/dev/null

if [ $? -eq 0 ]; then
    pushd $CURR_DIR/../sources/solarized-mate-terminal
    bash solarized-mate.sh
    popd
fi
