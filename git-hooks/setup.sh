#!/bin/bash

source git-hooks/vars.sh

for hook_file in "$HOOKS_DIR"/*; do
    hook_name=$(basename "$hook_file")
    symlink_path=".git/hooks/$hook_name"

    # Remove existing symlink if it exists
    if [ -L "$symlink_path" ]; then
        rm "$symlink_path"
    fi

    # Create symlink
    ln -s "../../$HOOKS_DIR/$hook_name" "$symlink_path"
done
