#! /usr/bin/env bash
################## var
PROJECT=$HOME/.dotfiles
DST_ETC=$HOME/.local/etc
if [ "$PWD" != "$PROJECT" ]; then
	# git clone respository
	rm -rf $PROJECT
	git clone https://github.com/lwllvyb/dotfiles.git $PROJECT
	if [ ! -d $PROJECT ]; then
		echo "dotfile clone fail"
		exit 1
	fi

fi
cd $PROJECT
git pull origin master

. scripts/functions.sh

find ./ -name "setup.sh" | while read setup; do
    $setup
done

success "Finished installing Dotfiles"
