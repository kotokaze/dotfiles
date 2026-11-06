#!/usr/bin/env zsh
0="${ZERO:-"${${0:#${ZSH_ARGZERO}}:-"${(%):-%N}"}"}"
0="${${(M)0:#/*}:-"${PWD}/${0}"}"

for script in "${0:h}/modules/"*/init.{sh,zsh,bash}(-.N); do _load "${script}"; done
