#!/bin/bash

source ../scripts/functions.sh
CURRENT_DIR_AB="$(realpath ./)"

APP="git"

info "Setting up $APP..."
#---- install tmux plugin ------------------------------------
[ -l $HOME/.gitmessage ] && rm $HOME/.gitmessage
ln -s ${CURRENT_DIR_AB}/gitmessage $HOME/.gitmessage

success "Finished setting up $APP."
