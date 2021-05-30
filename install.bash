#!/bin/bash

sudo apt -y update && sudo apt -y upgrade

sudo apt install -y \
	language-pack-ja \
	build-essential \
	wget \
	curl \
  llvm \
	clang \
	git \
  gh \
  unzip \

curl https://pyenv.run | bash

if [ ! -d $HOME/.cache/fonts ]
  mkdir -p $HOME/.cache/fonts

cd $HOME/.cache/fonts
curl https://github.com/belluzj/fantasque-sans/releases/latest/FantasqueSansMono-Normal.zip -o FantasqueSansMono-Normal.zip
unzip FantasqueSansMono-Normal.zip
cp -r FantasqueSansMono-Normal/* $HOME/.fonts
cd $HOME

echo 'export LANG=ja_JP.UTF-8' >> $HOME/.bash_profile
echo 'export LANGUAGE=ja_JP:ja' >> $HOME/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bash_profile
echo 'export USE_GIT_URI=git://' >> ~/.bash_profile
echo 'eval "$(ssh-agent)" 1>/dev/null 2>&1' >> $HOME/.bash_profile
echo 'eval "$(gh completion -s bash)"' >> ~/.bash_aliases
echo '\nif command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

