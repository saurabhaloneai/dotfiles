#!/bin/bash

echo "Installing dependencies..."
sudo apt update
sudo apt install -y git tmux wget curl build-essential

echo "Installing latest Neovim..."
cd ~
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -xzf nvim-linux64.tar.gz -C /opt
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz

echo "Creating config directories..."
mkdir -p ~/.config

echo "Setting up symlinks..."
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Installing TPM (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "✅ Dotfiles setup complete!"
echo "📝 Next steps:"
echo "1. Open nvim - plugins will auto-install"
echo "2. In tmux, press Ctrl+a then I to install tmux plugins"
nvim --version
