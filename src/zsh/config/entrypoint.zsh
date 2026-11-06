#!/usr/bin/env zsh
[[ "${DOTFILES_DEBUG:-false}" == 'true' ]] && set -x

# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html#zero-handling
0="${ZERO:-"${${0:#${ZSH_ARGZERO}}:-"${(%):-%N}"}"}"
0="${${(M)0:#/*}:-"${PWD}/${0}"}"

## personal helper variables
export USER_LOCAL="${HOME}/.local"
export USER_LOCAL_OPT="${USER_LOCAL}/opt"

function __source_with_emulate_if_available() {
  local file="${1}"
  readonly file
  shift

  if [[ ! -f "${target:A}" ]]; then
    echo "file not found: ${target}" >&2
    return 1
  fi

  local shebang
  shebang="$(head -n 1 "${file}")"
  readonly shebang

  if [[ "${shebang}" =~ ^#.*/bin/(env[[:space:]]+(-S[[:space:]]+)?)?([^[:space:]]+) ]]; then
    case "${match[3]}" in
      bash*)  emulate bash -c ". ${(q)file:A}" && return;;
      zsh*)   ;;
      *)      echo "no valid shebang found, treat ${q)file} as zsh" >&3;;
    esac
  fi

  . "${file:A}"
}

function _load() {
  local target="${1}"
  readonly target
  shift

  __source_with_emulate_if_available "${target}"

  local has_override=0
  for script in "${target:h}/include/"*.{sh,zsh,bash}(-.N); do
    [[ "${script:t}" =~ ^@override\.(z|ba)?sh$ ]] && { ((++has_override)); continue; }
    __source_with_emulate_if_available "${script}";
  done

  (( has_override )) && __source_with_emulate_if_available "${target:h}/include/@override".{sh,zsh,bash}(-.N)
}

case "${OSTYPE}" in
  linux*)  _load "${0:h}/linux/entrypoint.zsh";;
  darwin*) _load "${0:h}/macos/entrypoint.zsh";;
esac

_load "${0:h}/common/entrypoint.zsh"
unset -f _load __source_with_emulate_if_available
