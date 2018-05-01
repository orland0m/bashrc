#!/usr/bin/env bash

function SuggestBinary() {
    command -v $1 --help &>/dev/null || echo "WARN: $1 is missing from the system, you should install it for better bashrc integration"
}

SuggestBinary "colordiff"
SuggestBinary "ack"
SuggestBinary "nvim"
SuggestBinary "astyle"
SuggestBinary "json-diff"
SuggestBinary "npm"
