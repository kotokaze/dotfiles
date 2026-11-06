#!/usr/bin/env zsh
0="${ZERO:-"${${0:#${ZSH_ARGZERO}}:-"${(%):-%N}"}"}"
0="${${(M)0:#/*}:-"${PWD}/${0}"}"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  . "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for script in "${0:h}/modules/"*/init.{sh,zsh,bash}(-.N); do _load "${script}"; done
