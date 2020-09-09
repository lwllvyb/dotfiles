#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="karabiner"


info "Setting up $APP..."
rm -rf ~/.config/karabiner
ln -s $SOURCE/karabiner ~/.config
success "Finished setting up $APP."
