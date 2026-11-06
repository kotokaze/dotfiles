#!/usr/bin/env bash

export ANYENV_ROOT="${USER_LOCAL_OPT}/anyenv"
# export ANYENV_DEBUG=1

function _install_env_plugin() {
  local manager=${1}
  readonly manager

  local url=${2}
  readonly url

  # リポジトリ名を取得
  name="$(sed -E 's|.*/([^/.]+)(\.git)?/?$|\1|' <<<"${url}")"
  readonly name

  # インストール先パス
  dest="${ANYENV_ROOT}"
  [[ $manager == 'anyenv' ]] && dest+="/plugins" || dest+="/envs/${manager}/plugins"
  readonly dest

  [[ -d "${dest}" ]] || git clone "${url}" "${dest}/${name}"
}

if [ ! -d "${ANYENV_ROOT}" ]; then
  git clone 'https://github.com/anyenv/anyenv.git' "${ANYENV_ROOT}"
  "${ANYENV_ROOT}/bin/anyenv" install --init
fi
_install_env_plugin anyenv 'https://github.com/znz/anyenv-update.git'

export PATH="${ANYENV_ROOT}/bin:${PATH}"
eval "$(anyenv init -)"
