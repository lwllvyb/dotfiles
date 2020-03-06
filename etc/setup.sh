#! /usr/bin/env sh

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
	substep_info "Finished installing bash."
	substep_info "Installing zsh..."
	sed -i '' "\:$SOURCE/init.sh:d" $HOME/.zshrc
	echo ". $SOURCE/init.sh" >> $HOME/.zshrc
	substep_info "Finished installing zsh."
    # Do something unde Mac OS X platform
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	substep_info "Installing bash..."
	sed -i "\:$SOURCE/init.sh:d" $HOME/.bashrc
	echo ". $SOURCE/init.sh" >> $HOME/.bashrc
	substep_info "Finished installing bash."
	substep_info "Installing zsh..."
	sed -i "\:$SOURCE/init.sh:d" $HOME/.zshrc
	echo ". $SOURCE/init.sh" >> $HOME/.zshrc
	substep_info "Finished installing zsh."
    # Do something unde GNU/Linux platform
else
	error "Can't detect operation environment $(uname -s)"
	exit 1
fi

success "Finished setting up $APP."
