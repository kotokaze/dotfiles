#!/usr/bin/env zsh

if [[ ! -d "${ZINIT[BIN_DIR]}/.git/" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "${ZINIT[HOME_DIR]}" && command chmod g-rwX "${ZINIT[HOME_DIR]}"
  command git clone https://github.com/zdharma-continuum/zinit "${ZINIT[BIN_DIR]}" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

. "${ZINIT[BIN_DIR]}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

module_path+=( "${ZINIT[HOME_DIR]}/module/Src" )
# zmodload zdharma_continuum/zinit

# Load annexes, without Turbo (this is currently required for annexe, zinit's plugin)
zinit light-mode for \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-readurl \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-submods \
  zdharma-continuum/zinit-annex-binary-symlink \
  zdharma-continuum/zinit-annex-test
