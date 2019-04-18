#! /usr/bin/env bash

################## var
PROJECT=~/.dotfiles
DST_ETC=~/.local/etc



mkdir -p $DST_ETC

# git clone respository
rm -rf $PROJECT
git clone https://github.com/lwllvyb/dotfiles.git $PROJECT
if [ ! -d $PROJECT ]; then
	echo "dotfile clone fail"
	exit 1
fi
cd $PROJECT
cp -rf etc/* $DST_ETC/

################# source init.sh
sed -i "" "\:$DST_ETC/init.sh:d" ~/.bashrc
echo ". $DST_ETC/init.sh" >> ~/.bashrc

sed -i "" "\:$DST_ETC/init.sh:d" ~/.zshrc
echo ". $DST_ETC/init.sh" >> ~/.zshrc


################# vim /nvim
sed -i "" "\:$PWD/vim-init/init.vim:d" ~/.zshrc
echo "source $PWD/vim-init/init.vim" >> ~/.vimrc

mkdir -p ~/.config/nvim
ln -sf $PWD/vim-init/init.vim ~/.config/nvim/init.vim

#################
. ~/.bashrc
