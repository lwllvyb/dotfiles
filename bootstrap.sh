#! /usr/bin/env bash
DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh
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
	cd $PROJECT
fi


#################
# karabiner
find ./ -name "setup.sh" | while read setup; do
    $setup
done

success "Finished installing Dotfiles"
