#! /usr/bin/env bash

ETC=~/.local/etc
BIN=~/.local/bin
mkdir -p $ETC
mkdir -p $BIN

# git clone respository
mkdir -p .tmp
cd .tmp
rm -rf dotfiles
git clone https://github.com/lwllvyb/dotfiles
cd dotfiles
cp -rf etc/* $ETC/
cp -rf bin/* $BIN/

# source init.sh
sed -i "\:$ETC/init.sh:d" ~/.bashrc
echo ". $ETC/init.sh" >> ~/.bashrc
. ~/.bashrc

# for neovim
mkdir -p ~/.config/nvim
cp $ETC/init.vim ~/.config/nvim/init.vim

# source vimrc.vim
touch ~/.vimrc
sed -i "\:$ETC/vimrc.vim:d" ~/.vimrc
echo "source $ETC/vimrc.vim" >> ~/.vimrc

# source tmux.conf
touch ~/.tmux.conf
sed -i "\:$ETC/tmux.conf:d" ~/.tmux.conf
echo "source $ETC/tmux.conf" >> ~/.tmux.conf
