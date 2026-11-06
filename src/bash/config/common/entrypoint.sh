#!/usr/bin/env bash
local BASH_ARGV0="${ZERO:-"${BASH_SOURCE[0]:-"${0}"}"}"
[[ "${BASH_ARGV0}" == /* ]] || BASH_ARGV0="${PWD/${0}}"

for script in "$(dirname "${BASH_ARGV0}")/modules/"*/init.sh; do _load "${script}"; done
