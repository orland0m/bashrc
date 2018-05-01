#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add load to ~/.bashrc
printf "source $CURR_DIR/bashrc\n" >> ~/.bashrc

# Dependencies
$CURR_DIR/opt/installer.help/suggest_bashrc_binaries.sh

# Git configuration
git submodule update --init --recursive
hash git &>/dev/null && git config --global core.excludesfile $CURR_DIR/config/git/gitignore_global
