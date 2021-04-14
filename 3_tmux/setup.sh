#!/bin/bash

. ../scripts/functions.sh
CURRENT_DIR_AB="$(realpath ./)"
TMUX_GIT=${CURRENT_DIR_AB}/tmux/

APP="tmux"

info "Setting up $APP..."
#---- install tmux plugin ------------------------------------
[ -d ~/.tmux/plugins ] || mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ${TMUX_GIT}/tmux.conf  ~/.tmux.conf

# install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

success "Finished setting up $APP."
