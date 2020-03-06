#! /usr/bin/env sh
if [ "$(uname)" != "Darwin" ]; then
	info "Not mac os, no need to install karabiner."
	exit 0
fi

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath ./)"
DESTINATION="$(realpath ~/.config/karabiner)"

info "Setting up Karabiner Elements..."

substep_info "Creating Karabiner Elements folder..."
mkdir -p $DESTINATION

find * -name "*.json" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clear_broken_symlinks "$DESTINATION"

success "Finished setting up Karabiner Elements."
