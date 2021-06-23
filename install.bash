#!/bin/bash
cd ~
sudo apt update && sudo apt -y upgrade
sudo apt install -y \
  language-pack-ja \
  build-essential \
  clang \
  cmake \
  gh \
  unzip \
sudo locale-gen ja_JP ja_JP.UTF-8
sudo update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8

ln -isv ~/.cache/dotfiles/src/git/gitmessage.txt .gitmessage.txt
ln -isv .cache/dotfiles/src/git/gitconfig .gitconfig
ln -isv ~/.cache/dotfile/src/nanorc .nanorc
ln -isv ~/.cache/dotfile/src/vim/vimrc .vimrc

echo 'export LANG=ja_JP.UTF-8' >> ~/.profile
echo 'export USE_GIT_URI=git://' >> ~/.profile
echo 'eval "$(gh completion -s bash)"' >> ~/.aliases
source ~/.bashrc

echo "Font download: https://github.com/belluzj/fantasque-sans/releases/latest/download/FantasqueSansMono-Normal.zip"
