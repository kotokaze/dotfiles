#!/bin/bash

sudo apt update && sudo apt -y upgrade

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update && sudo apt install -y \
  language-pack-ja \
  build-essential \
  clang \
  cmake \
  gh \
  unzip \
sudo locale-gen ja_JP ja_JP.UTF-8
sudo update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8

cd ~
ln -isv ~/.config/dotfiles/src/git/gitmessage.txt .gitmessage.txt
ln -isv .config/dotfiles/src/git/gitconfig .gitconfig
ln -isv ~/.config/dotfile/src/nano/nanorc .nanorc
ln -isv ~/.config/dotfile/src/vim/vimrc .vimrc
FantasqueSansMono-Normal.zip
echo 'export LANG=ja_JP.UTF-8' >> ~/.profile
echo 'export USE_GIT_URI=git://' >> ~/.profile
echo 'eval "$(gh completion -s bash)"' >> ~/.bash_profile
echo 'eval "$(ssh-agent)"' >> ~/.bash_profile
echo 'export "GPG_TTY"=$(tty)' >> ~/.bash_profile
source ~/.bashrc

curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh
curl https://github.com/belluzj/fantasque-sans/releases/latest/download/FantasqueSansMono-Normal.zip > ~/.cache/FantasqueSansMono-Normal.zip
