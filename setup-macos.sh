#!/bin/bash
# macOS setup
set -e

echo "Setting up dotfiles for macOS..."

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew install helix zellij lazygit neovim

echo "Linking configs..."
mkdir -p ~/.config/helix ~/.config/zellij

# remove old symlinks
[ -L ~/.config/nvim ] && rm ~/.config/nvim
[ -L ~/.config/helix/config.toml ] && rm ~/.config/helix/config.toml
[ -L ~/.config/zellij/config.kdl ] && rm ~/.config/zellij/config.kdl

ln -sf ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -sf ~/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml 2>/dev/null || true

echo ""
echo "Done! Run 'zellij' to start, 'hx .' to edit."
echo ""
echo "Installed:"
hx --version
zellij --version
