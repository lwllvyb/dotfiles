#! /usr/bin/env bash

ETC=~/.local/etc
mkdir -p $ETC

# git clone respository
mkdir -p .tmp
cd .tmp
rm -rf dotfiles
git clone https://github.com/lwllvyb/dotfiles.git
cd dotfiles
cp -rf etc/* $ETC/

# source init.sh
sed -i "\:$ETC/init.sh:d" ~/.bashrc
echo ". $ETC/init.sh" >> ~/.bashrc
. ~/.bashrc
