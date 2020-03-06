#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="bin"

shell_format() {
    local env=$1
    local bin_path=./shfmt
    if [ -f $bin_path ]; then
        $bin_path -version >/dev/null 2>&1
        if [ "$?" == "0" ]; then
            substep_info "shfmt already be installed"
            return 0
        fi
    fi
    substep_info "Installing shfmt ..."
    rm -f $bin_path
    if [ "$env" == "Darwin" ]; then
        wget -q https://github.com/mvdan/sh/releases/download/v3.0.2/shfmt_v3.0.2_darwin_amd64 -O $bin_path
    elif [ "$env" == "Linux" ]; then
        wget -q https://github.com/mvdan/sh/releases/download/v3.0.2/shfmt_v3.0.2_linux_amd64 -O $bin_path
	else
		error "Unkown operation $env"
    fi
    substep_info "Finished installing shfmt."
}

info "Setting up $APP.."
if [ "$(uname)" == "Darwin" ]; then
	shell_format "Darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	shell_format "Linux"
fi

success "Finished setting up $APP."
