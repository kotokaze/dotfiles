#!/usr/bin/env zsh

typeset -gA ZINIT=(
  [HOME_DIR]="${USER_LOCAL_OPT}/zinit"
  [BIN_DIR]="${USER_LOCAL_OPT}/zinit/zinit.git"
  [ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-"${HOME}/.cache"}/zcompdump"
  [COMPINIT_OPTS]="-C -d \"${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}\""
  # [OPTIMIZE_OUT_DISK_ACCESSES]=1
)
