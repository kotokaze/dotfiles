#!/usr/bin/env zsh

export HISTORY_IGNORE="(cd|pwd|l[sl]|\:q)"
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
[[ ! -d "${HISTFILE:A:h}" ]] && mkdir -p "${HISTFILE:A:h}"
