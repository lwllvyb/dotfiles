#!/usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

info "Installing coc..."

# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
	substep_info "Installing node..."
    curl -s --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
	substep_info "Finished installing node."
fi

# Use package feature to install coc.nvim

# for vim8
substep_info "Installing coc for vim..."
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl -s --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzf -
substep_info "Finished installing coc for vim..."
# for neovim
substep_info "Installing coc for nvim..."
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
curl -s --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzf -
substep_info "Finished installing coc for nvim..."

# Install extensions
substep_info "Installing coc extensions..."
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
substep_info "Finished installing coc extensions."
success "Finished coc."
npm install
