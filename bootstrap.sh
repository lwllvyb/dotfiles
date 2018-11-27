#! /usr/bin/env bash

ETC=~/.local/etc
BIN=~/.local/bin
mkdir -p $ETC
mkdir -p $BIN

# git clone respository
mkdir -p .tmp
cd .tmp
rm -rf dotfiles
git clone https://github.com/lwllvyb/dotfiles.git
cd dotfiles
cp -rf etc/* $ETC/
cp -rf bin/* $BIN/

# source init.sh
sed -i "\:$ETC/init.sh:d" ~/.bashrc
echo ". $ETC/init.sh" >> ~/.bashrc
. ~/.bashrc
