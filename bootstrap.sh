#! /usr/bin/env bash
DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh
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

#################
# karabiner
find ./ -name "setup.sh" | while read setup; do
    $setup
done

success "Finished installing Dotfiles"
