#!/usr/bin/env bash

XDG_CONFIG_DIR="${XDG_CONFIG_DIR:-${HOME}/.config}"


function linkFile() {
  echo 'Linkng "${1}" to "${2}"'
  ln -s "${1}" "${2}"
}

for dname in $(find ./src/* -maxdepth 1 -type d | cut -c 3-); do
  local src = "${PWD}/${dname}"
  local dst = "${XDG_CONFIG_DIR}/$(basename "${dname}")"
  linkFile "${src}" "${dst}"
done

# Setup powerline
cat <<EOF >> ${HOME}/.bashrc

XDG_CONFIG_DIR="${XDG_CONFIG_DIR:-${HOME}/.config}"

# Setup powerline
if [ -f "${XDG_CONFIG_DIR}/bash-powerline/bash-powerline.sh" ]; then
  source "${XDG_CONFIG_DIR}/bash-powerline/bash-powerline.sh"
fi
EOF

# AInstall GitHub CLI
# type -p curl >/dev/null || (sudo apt update && sudo apt install -y curl)
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
#   | sudo dd of=/etc/apt/keyrings/githubcli-archive-keyring.gpg \
#   && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
#   && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
#   | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
#   && sudo apt update \
#   && sudo apt install -y gh

# gh release download belluzj/fantasque-sans --pattern "FantasqueSansMono-*.zip" --dir "${HOME}/Downloads/"
