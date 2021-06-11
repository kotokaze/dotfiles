#!/bin/bash
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

if [! -d $HOME/.caches/fonts ]
  mkdir -p ~/.cache/fonts

wget -vO ~/.cache/fonts/FantasqueSansMono-Normal.zip https://github.com/belluzj/fantasque-sans/releases/latest/download/FantasqueSansMono-Normal.zip
unzip ~/.cache/fonts/FantasqueSansMono-Normal.zip ~/.cache/FantasqueSansMono-Normal
cp -r ~/.cache/fonts/FantasqueSansMono-Normal/* ~/.fonts

ln -isv .src/git/gitmessage.txt ~/.gitmessage.txt
ln -isv .src/git/gitconfig ~/.gitconfig
ln -isv .src/nanorc ~/.nanorc
ln -isv .src/vim/vimrc ~/.vimrc

echo 'export LANG=ja_JP.UTF-8' >> ~/.profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export USE_GIT_URI=git://' >> ~/.profile
echo 'eval "$(ssh-agent)" 1>/dev/null 2>&1' >> ~/.profile
echo 'eval "$(gh completion -s bash)"' >> ~/.aliases
echo '\nif command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
source ~/.bashrc

curl https://pyenv.run | bash
