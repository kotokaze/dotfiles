#!/bin/sh

# Hash
[ ! -x $(command -v sha256sum) ] && alias sha256sum='shasum -a 256 '
[ ! -x $(command -v sha512sum) ] && alias sha512sum='shasum -a 512 '

# HTTP-Server
alias http-server='http-server -p 8080 -c-1 '
alias hs='http-server '

# SSH
alias ssh-copy-id='ssh-copy-id -o PreferredAuthentications=password '

# Container
# [[ $commands[docker] ]] && alias ffmpeg='docker run --rm -v `pwd`:/tmp/workdir jrottenberg/ffmpeg:3.3 '
# [[ $commands[docker] ]] && alias MP4Box='docker run --rm -v `pwd`:/work sambaiz/mp4box'

# Batcat
alias cat='bat --paging=never '

# Git
alias g='git'
alias cd-git-root='cd $(git rev-parse --show-toplevel)'
alias 'gcom!'='git commit -v --amend '
alias gmv='git mv '
alias gbr='git branch '
alias gbrm='git branch -m '
alias gck='git checkout '
alias gckb='git checkout -b '
alias {gpull,gpl}='git pull '
alias {gpush,gpu}='git push '
alias {gpush!,gpu!}='git push --force'
alias gremote='git remote -v '
alias gfetch='git fetch '
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'

# Disk
alias df='duf -theme ansi'

# Exa
alias exa='exa --time-style="long-iso"'
alias ls='exa --icons '
alias ll='ls -alF'
alias l='ls -F'

# Eza (since exa is depricated)
alias eza='eza --time-style=long-iso '
alias ls='eza --icons=always --hyperlink '

# Create a temporary image
alias tmp-png="php -r '\$i=imagecreate(500, 500);imagecolorallocate(\$i, 0, 0, 255);imagepng(\$i, \"tmp.png\");'"

# Create a random password
alias pass='cat /dev/urandom | base64 | fold -w 15 | head -n 1 | tee /dev/stderr | pbcopy'

alias where='command -v '
alias wget='wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts" '

function trash() {
  local fpath="$(abspath "$1")"
  if [ -z fpath ]; then
    echo "Usage: trash <file>"
    return 1
  fi
  mv ${fpath} "${HOME}/.Trash/$(date +%Y%m%d-%H%M%S)_$(basename ${fpath})"
}

# Convert into a GIF
function gif2() {
  ffmpeg -i $(abspath $1) -vf fps=10,scale=1280:-1 -r 24 "$(abspath .)/out.gif"
}

function zip2() {
  zip -rT9 "$(abspath .)/$(basename $1).zip" "$(abspath $1)"
}

function md5comp () {
  md5 -r "$(abspath $1)" | rg $2
}

function gtagd() {
  git tag -d $1 && git push origin :refs/tags/$1
}

function gitignore() {
  curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

function prepend2path() {
  case ":${PATH}:" in  # Enclose with `:` for comparison
    *:"$1":*)
      ;;
    *)
      [[ -d "$1" ]] && export PATH="$1:$PATH"
      ;;
  esac
}

# Exit like Vi
alias :q='exit'

# **************************************************************************** #
# Ref: https://gist.github.com/hightemp/5071909/

# Output
alias lowercase="tr '[:upper:]' '[:lower:]'"
alias lcase='lowercase'
alias uppercase="tr '[:lower:]' '[:upper:]'"
alias ucase='uppercase'

# OS
[ "$(uname | lcase)" = 'darwin' ] && OS_MAC=true
if [ $OS_MAC ]; then
  . ${ZDOTDIR}/macos/include.sh
elif [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
  [ $(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | lcase) = 'ubuntu' ] && OS_UBUNTU=true
fi


# ls variants
alias lsd='ls -d .*'

# Various
alias mvi='mv -i'
alias rmi='rm -i'

# Directories
alias ..='cd ..'

# Syste
alias du="du -h"
$MAC_OS && alias nproc="echo $(sysctl -n hw.logicalcpu_max)"

# Archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}
alias extr='extract '

function extract_and_remove {
  extract $1
  trash $1
}
alias extrr='extract_and_remove '

# Relative path to absolute path
function abspath() {
    if [ -d "$1" ]; then
        echo "$(cd $1; pwd)"
    elif [ -f "$1" ]; then
        if [[ $1 == */* ]]; then
            echo "$(cd ${1%/*}; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}
alias abspath='abspath '

# Files
alias lcf="rename 'y/A-Z/a-z/' "
alias ucf="rename 'y/a-z/A-Z/' "

# Vim
alias v='vim'

# Ubuntu apt
if [ $OS_UBUNTU ]; then
  alias apti='sudo apt show '
  alias apts='apt search '
  alias aptu='sudo apt update '
  alias aptuu='sudo aptu; sudo apt upgrade'
fi

# Homebrew
if [[ "$SHELL" == */zsh ]]; then
  if (( $+commands[brew] )); then
    alias brewi='brew info '
    alias brews='brew search '
    alias brewu='brew update '
  fi
fi

# Git
alias gst='git status'
alias gb='git branch'
alias gadd='git add '
alias gcom='git commit -v '

# DNS
alias {hostname2ip,h2ip}='dig +short'
