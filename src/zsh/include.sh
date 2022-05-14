#!/bin/sh

alias pass='cat /dev/urandom | base64 | fold -w 15 | head -n 1 | tee /dev/stderr | pbcopy'
alias ffmpeg='docker run --rm -v `pwd`:/tmp/workdir jrottenberg/ffmpeg:3.3'
# alias MP4Box='docker run --rm -v `pwd`:/work sambaiz/mp4box'
alias cat='bat --paging=never'
alias cd-git-root='cd $(git rev-parse --show-toplevel)'
alias exa='exa --time-style="long-iso"'
alias ls='exa --icons'
alias wget='wget --hsts-file="${XDG_CACHE_HOME}/wget-hsts"'
alias zip='zip -rT9'
alias tmp-png='php -r "$i = imagecreate(500, 500); imagecolorallocate($i, 0, 0, 255); imagepng($i, "tmp.png");"'

function gif2() {
  ffmpeg -i $1 -vf fps=10,scale=1280:-1 -r 24 out.gif
}

function md5comp () {
  md5 -r $1 | rg $2 && echo 'Correct !'
}

function gitignore() {
  curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}
alias gi='gitignore '

function prepend2path() {
  case ":${PATH}:" in  # Enclose with `:` for comparison
    *:"$1":*)
      ;;
    *)
      if [[ -d "$1" ]]; then
        export PATH="$1:$PATH"
      fi
      ;;
  esac
}

# **************************************************************************** #
# Ref: https://gist.github.com/hightemp/5071909/

# Output
alias lowercase="tr '[:upper:]' '[:lower:]'"
alias lcase='lowercase'
alias uppercase="tr '[:lower:]' '[:upper:]'"
alias ucase='uppercase'

# OS
[ "$(uname | lcase)" = 'darwin' ] && OS_MAC=true
if [ !$OS_MAC ] && [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
  [ $(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | lcase) = 'ubuntu' ] && OS_UBUNTU=true
fi


# ls variants
alias lsd='ls -d .*'
alias ll='ls -alF'

# Various
alias mvi='mv -i'
alias rmi='rm -i'

# Directories
alias ..='cd ..'

# Syste
alias df="df -h"
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
  rm -f $1
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
alias abspath="abspath "

# Files
alias lcf="rename 'y/A-Z/a-z/' "
alias ucf="rename 'y/a-z/A-Z/' "

# Ubuntu apt
if [ $OS_UBUNTU ]; then
  alias apti='sudo apt install'
  alias apts='apt search'
  alias aptu='sudo apt update'
  alias aptuu='sudo aptu; sudo apt upgrade;'
fi

# Homebrew
if [[ "$SHELL" == */zsh ]]; then
  if (( $+commands[brew] )); then
    alias brewi='brew install'
    alias brews='brew search'
    alias brewu='brew update'
  fi
fi

# Git
alias gstat='git status'
alias gadd='git add '
alias gcom='git commit'

# DNS
alias {hostname2ip,h2ip}='dig +short'
