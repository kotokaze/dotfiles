#!/usr/bin/env bash

[ ! -x "$(command -v brew)" ] && eval "$(curl -sSLf https://raw.github.com/Homebrew/install/HEAD/install.sh)"

eval "$(brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(brew command-not-found-init)"
