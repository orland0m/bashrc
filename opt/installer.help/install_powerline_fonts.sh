#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $CURR_DIR/../sources/powerline_fonts
./install.sh
popd
