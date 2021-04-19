#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="vim"


info "Setting up $APP..."
substep_info "Installing vim8..."
mv -f $HOME/.vimrc $HOME/.vimrc.bak.$(date +"%Y%m%d_%H%M")
symlink "$SOURCE/init.vim " "$HOME/.vimrc"
mkdir -p $HOME/.vim/
symlink "$SOURCE/coc-settings.json" "$HOME/.vim/coc-settings.json"
mkdir -p $HOME/.config/coc/extensions
symlink "$SOURCE/package.json" "$HOME/.config/coc/extensions/package.json"
substep_info "Finished installing vim8."

substep_info "Installing nvim..."
[ -d $HOME/.config/nvim ] && mv $HOME/.config/nvim $HOME/.config/nvim.bak.$(date +"%Y%m%d_%H%M")
mkdir -p $HOME/.config/nvim
symlink "$SOURCE/init.vim" "$HOME/.config/nvim/init.vim"
symlink "$SOURCE/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
symlink "$SOURCE/package.json" "$HOME/.config/coc/extensions/package.json"
substep_info "Finished installing nvim."

# install coc use script

success "Finished setting up $APP."
