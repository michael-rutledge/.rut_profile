#!/bin/bash

# Use once to link real files from your home directory here

ln -f -s "$(pwd)"/.vimrc "$HOME"/.vimrc

ln -f -s "$(pwd)"/.bashrc "$HOME"/.bashrc
ln -f -s "$(pwd)"/.inputrc "$HOME"/.inputrc
ln -f -s "$(pwd)"/.bash_profile "$HOME"/.bash_profile

source "$HOME"/.bashrc
