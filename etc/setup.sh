#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
APP="shell"
shell_format() {
    local env=$1
    local shfmt_bin=./bin/shfmt
    if [ -f "$shfmt_bin" ]; then
        $shfmt_bin -version >/dev/null 2>&1
        if [ "$?" == "0"]; then
            success ""
            return
        fi
    fi
    rm -f $shfmt_bin
    if [ "$env" == "Darwin" ]; then
        wget -q https://github.com/mvdan/sh/releases/download/v3.0.2/shfmt_v3.0.2_darwin_amd64 $shfmt_bin

    fi
}

info "Setting up $APP..."
install() {
    if [ "$(uname)" == "Darwin" ]; then
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # Do something unde GNU/Linux platform
        echo '1'
    else
        error "Can't detect operation environment $(uname -s)"
        return 1
    fi
}

success "Finished setting up $APP."
