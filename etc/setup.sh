#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="shell"

info "Setting up $APP..."

if [ "$(uname)" == "Darwin" ]; then
	substep_info "Installing bash..."
	sed -i '' "\:$SOURCE/init.sh:d" $HOME/.bashrc
	echo ". $SOURCE/init.sh" >> $HOME/.bashrc
	sed -i '' "\:$SOURCE/z.sh:d" $HOME/.bashrc
	echo ". $SOURCE/z.sh" >> $HOME/.bashrc
	substep_info "Finished installing bash."

	if [ -f "$HOME/.zshrc" ]; then
		substep_info "Installing zsh..."
		sed -i '' "\:$SOURCE/init.sh:d" $HOME/.zshrc
		echo ". $SOURCE/init.sh" >> $HOME/.zshrc
		sed -i '' "\:$SOURCE/z.sh:d" $HOME/.zshrc
		echo ". $SOURCE/z.sh" >> $HOME/.zshrc
		substep_info "Finished installing zsh."
	fi
    # Do something unde Mac OS X platform
elif [ "$(uname -s)" == "Linux" ]; then
	substep_info "Installing bash..."
	sed -i "\:$SOURCE/init.sh:d" $HOME/.bashrc
	echo ". $SOURCE/init.sh" >> $HOME/.bashrc
	sed -i "\:$SOURCE/z.sh:d" $HOME/.bashrc
	echo ". $SOURCE/z.sh" >> $HOME/.bashrc
	substep_info "Finished installing bash."
	if [ -f "$HOME/.zshrc" ]; then
		substep_info "Installing zsh..."
		sed -i "\:$SOURCE/init.sh:d" $HOME/.zshrc
		echo ". $SOURCE/init.sh" >> $HOME/.zshrc
		sed -i "\:$SOURCE/z.sh:d" $HOME/.zshrc
		echo ". $SOURCE/z.sh" >> $HOME/.zshrc
		substep_info "Finished installing zsh."
	fi
    # Do something unde GNU/Linux platform
else
	error "Can't detect operation environment $(uname -s)"
	exit 1
fi

success "Finished setting up $APP."
