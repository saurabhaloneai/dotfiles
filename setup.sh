#!/bin/bash

# install dependencies
sudo apt update
sudo apt install -y git tmux neovim

# create config directories
mkdir -p ~/.config

# setup symlinks
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Dotfiles setup complete!"
