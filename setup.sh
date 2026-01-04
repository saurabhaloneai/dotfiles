#!/bin/bash

echo "Installing dependencies..."
sudo apt update
sudo apt install -y git tmux curl build-essential

echo "Installing latest Neovim via snap..."
sudo snap install nvim --classic

echo "Creating config directories..."
mkdir -p ~/.config

echo "Setting up symlinks..."
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Installing TPM (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2>/dev/null || echo "TPM already installed"

echo "✅ Dotfiles setup complete!"
echo "📝 Next steps:"
echo "1. Open nvim - plugins will auto-install"
echo "2. In tmux, press Ctrl+a then I to install tmux plugins"
nvim --version
