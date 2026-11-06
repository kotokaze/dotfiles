#!/usr/bin/env bash

# Hash
[ ! -x "$(command -v sha256sum)" ] && [ -x "$(command -v shasum)" ] && alias sha256sum='shasum -a 256 '
[ ! -x "$(command -v sha256sum)" ] && [ -x "$(command -v shasum)" ] && alias sha512sum='shasum -a 512 '

# Node HTTP server
if [ -x "$(command -v http-server)" ]; then
  alias http-server='http-server -p 8080 -c-1 '
  alias hs='http-server '
fi

# SSH
alias ssh-copy-id='ssh-copy-id -o PreferredAuthentications=password '

# Run inside container
if [ -x "$(command -v docker)" ]; then
  alias ffmpeg='docker run --rm -v `pwd`:/tmp/workdir jrottenberg/ffmpeg:3.3 '
  alias MP4Box='docker run --rm -v `pwd`:/tmp/workdir sambaiz/mp4box:latest'
fi

# Batcat
[ -x "$(command -v bat)" ] \
 && alias cat='bat --paging=never '

# Disk
alias df='duf -theme ansi '

# Exit like Vi
alias :q='exit'

## GPG
export GPG_TTY="$(tty)"
