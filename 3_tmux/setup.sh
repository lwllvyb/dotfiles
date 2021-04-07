#!/bin/bash

. ../scripts/functions.sh
CURRENT_DIR_AB="$(realpath ./)"
TMUX_GIT=${CURRENT_DIR_AB}/tmux/

APP="tmux"

info "Setting up $APP..."
ln -s ${TMUX_GIT}/tmux.conf  ~/.tmux.conf
success "Finished setting up $APP."
