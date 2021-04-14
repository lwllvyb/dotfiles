#!/bin/bash

source ../scripts/functions.sh
CURRENT_DIR_AB="$(realpath ./)"
TMUX_GIT=${CURRENT_DIR_AB}/tmux/

APP="tmux"

info "Setting up $APP..."
#---- install tmux plugin ------------------------------------
[ -d $HOME/.tmux/plugins ] || mkdir -p $HOME/.tmux/plugins
[ -d $HOME/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

rm $HOME/.tmux.conf
ln -s ${TMUX_GIT}/tmux.conf  $HOME/.tmux.conf
tmux source $HOME/.tmux.conf
# install plugins
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

success "Finished setting up $APP."
