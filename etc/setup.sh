#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="shell"

info "Setting up $APP..."
scripts=(init.sh z.sh promot_256.sh)

if [ "$(uname)" == "Darwin" ]; then
	substep_info "Installing bash for Mac..."
	for script in ${scripts[@]}; do
		sed -i '' "\:$SOURCE/${script}:d" $HOME/.bashrc
		echo ". $SOURCE/${script}" >> $HOME/.bashrc
	done
	substep_info "Finished installing bash for Mac."

	if [ -f "$HOME/.zshrc" ]; then
		substep_info "Installing zsh for Mac..."
		for script in ${scripts[@]}; do
			sed -i '' "\:$SOURCE/${script}:d" $HOME/.zshrc
			echo ". $SOURCE/${script}" >> $HOME/.zshrc
		done
		substep_info "Finished installing zsh for Mac."
	fi
    # Do something unde Mac OS X platform
elif [ "$(uname -s)" == "Linux" ]; then
	substep_info "Installing bash for Linux..."
	for script in ${scripts[@]}; do
		sed -i "\:$SOURCE/${script}:d" $HOME/.bashrc
		echo ". $SOURCE/${script}" >> $HOME/.bashrc
	done
	substep_info "Finished installing bash for Linux."

	if [ -f "$HOME/.zshrc" ]; then
		substep_info "Installing zsh for Linux..."
		for script in ${scripts[@]}; do
			sed -i "\:$SOURCE/${script}:d" $HOME/.zshrc
			echo ". $SOURCE/${script}" >> $HOME/.zshrc
		done
		substep_info "Finished installing zsh for Linux."
	fi
else
	error "Can't detect operation environment $(uname -s)"
	exit 1
fi

success "Finished setting up $APP."
