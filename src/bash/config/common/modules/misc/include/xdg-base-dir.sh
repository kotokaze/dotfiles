#!/usr/bin/env bash
## See also: https://wiki.archlinux.org/title/XDG_Base_Directory

export ANDROID_HOME="${XDG_DATA_HOME}/android"

export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"
export ANSIBLE_LOCAL_TEMP="${XDG_CACHE_HOME}/ansible/tmp"
export ANSIBLE_REMOTE_TEMP="${XDG_CACHE_HOME}/ansible/tmp"
export ANSIBLE_SSH_CONTROL_PATH_DIR="${XDG_CACHE_HOME}/ansible/cp"
export ANSIBLE_ASYNC_DIR="${XDG_CACHE_HOME}/ansible_async"

export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"

export AZURE_CONFIG_DIR="${XDG_DATA_HOME}/azure"

export BASH_COMPLETION_USER_FILE="${XDG_CONFIG_HOME}/bash-completion/bash_completion"
alias bashdb='bashdb -x "${XDG_CONFIG_HOME}/bashdb/bashdbinit"'

export BUN_INSTALL="${XDG_DATA_HOME}/bun"

export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export CALCHISTFILE="${XDG_CACHE_HOME}/calc_history"

export CLAUDE_CONFIG_DIR="${XDG_CONFIG_HOME}/claude"

export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"

# exprt DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"

# export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
# export MACHINE_STORAGE_PATH="${XDG_DATA_HOME}/docker-machine"

export FFMPEG_DATADIR="${XDG_CONFIG_HOME}/ffmpeg"

export GDBHISTFILE="${XDG_STATE_HOME}/gdb/history"

export COPILOT_HOME="${XDG_CONFIG_HOME}/copilot"

export SAKURACLOUD_PROFILE_DIR="${XDG_CONFIG_HOME}/"

export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
export SCREENDIR="${XDG_RUNTIME_DIR}/screen"

# Golang
export GOPATH="${XDG_DATA_HOME}/go"
export GOMODCACHE="${XDG_CACHE_HOME}/go/mod"

export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"

# GTK
export GTK_RC_FILES="${XDG_CONFIG_HOME}/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"

export _JAVA_OPTIONS='-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java" -Djavafx.cachedir="${XDG_CACHE_HOME}/openjfx"'
export JAVA_TOOL_OPTIONS='-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java" -Djavafx.cachedir="${XDG_CACHE_HOME}/openjfx"'

export MINIKUBE_HOME="${XDG_DATA_HOME}/minikube"
export KUBECONFIG="${XDG_CONFIG_HOME}/kube"
export KUBECACHEDIR="${XDG_CACHE_HOME}/kube"

export MYSQL_HISTFILE="${XDG_DATA_HOME}/mysql/history"

# Node
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node/repl_history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"

export CODEX_HOME="${XDG_CONFIG_HOME}/codex"

export PARALLEL_HOME="${XDG_CONFIG_HOME}/parallel"

export PHP_HISTFILE="${XDG_STATE_HOME}/php/history"

# Python
export MYPY_CACHE_DIR="${XDG_CACHE_HOME}/mypy"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export JUPYTER_PLATFORM_DIRS="1"
export PLATFORMIO_CORE_DIR="${XDG_DATA_HOME}/platform-io"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint"
export PYTHON_HISTORY="${XDG_STATE_HOME}/python_history"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export PYTHON_EGG_CACHE="${XDG_CACHE_HOME}/python-eggs"

# ruby
export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

export SQLITE_HISTORY="${XDG_DATA_HOME}/sqlite/history"

export TEXMFHOME="${XDG_DATA_HOME}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config"

export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${XDG_DATA_HOME}/vagrant/aliases"

export WGETRC="${XDG_CONFIG_HOME}/wget/config"
alias wget="wget --hsts-file=${XDG_STATE_HOME}/wget-hsts"

export USERXSESSION="${XDG_CACHE_HOME}/X11/xsession"
export USERXSESSIONRC="${XDG_CACHE_HOME}/X11/xsessionrc"
export ALTUSERXSESSION="${XDG_CACHE_HOME}/X11/Xsession"
export ERRFILE="${XDG_CACHE_HOME}/X11/xsession-errors"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"
export XCOMPOSEFILE="${XDG_CONFIG_HOME}/X11/xcompose"
export XCOMPOSECACHE="${XDG_CACHE_HOME}/X11/xcompose"

alias yarn='yarn --use-yarnrc "${XDG_CONFIG_HOME}/yarn/config"'
