#!/usr/bin/env bash
[[ "${DOTFILES_DEBUG:-false}" == 'true' ]] && set -x

BASH_ARGV0="${ZERO:-"${BASH_SOURCE[0]:-"${0}"}"}"
[[ "${BASH_ARGV0}" == /* ]] || BASH_ARGV0="${PWD/${0}}"

# Return an empty array if there is no glob match
shopt -s nullglob

# personal helper variables
export USER_LOCAL="${HOME}/.local"
export USER_LOCAL_OPT="${USER_LOCAL}/opt"

function _load() {
  local target="${1}"
  readonly target
  shift

  if [[ ! -f "$(realpath "${target}")" ]]; then
    echo "file not found: ${target}" >&2
    return 1
  fi

  . "${target}"

  local has_override=0
  for path in "$(dirname "${target}")/include/"*; do
    local file="$(basename "${path}")"

    [[ ! "${file}" =~ ^.*\.(ba)?sh$ ]] && { continue; }
    [[ "${file}" =~ ^@override\.sh$ ]] && { ((++has_override)); continue; }

    . "${path}"
  done

  (( has_override )) && . "$(dirname "${target}")/include/@override.sh"
}

# OS specific setup
case "${OSTYPE}" in
  linux*)  _load "$(dirname "${BASH_ARGV0}")/linux/entrypoint.sh";;
  darwin*) _load "$(dirname "${BASH_ARGV0}")/macos/entrypoint.sh";;
esac

# common setup
_load "$(dirname "${BASH_ARGV0}")/common/entrypoint.sh"

unset -f _load
