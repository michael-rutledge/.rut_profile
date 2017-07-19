#!/bin/bash

# Use once to link real files from your home directory here

ln -f -s "$(pwd)"/.vimrc "$HOME"/.vimrc

ln -f -s "$(pwd)"/.bashrc "$HOME"/.bashrc
ln -f -s "$(pwd)"/.inputrc "$HOME"/.inputrc
ln -f -s "$(pwd)"/.bash_profile "$HOME"/.bash_profile

# create customEnv.sh if not already there
if ! [ -f "customEnv.sh" ]; then
    echo -e "# This is customEnv.sh. Put any personal environment variables here.\n\
#\n# Example: export CDPATH='.:~:/:Desktop:Documents'" > customEnv.sh
    echo "Created customEv.sh"
fi
# finally, load bashrc
source "$HOME"/.bashrc
