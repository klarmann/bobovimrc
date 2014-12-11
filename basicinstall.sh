#!/bin/sh
# install bobo lvlv vimrc
# vundele download && plugIns install
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# install under Ubuntu nessesary package for YCM 必要的包包
sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
