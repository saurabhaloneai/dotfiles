#!/bin/bash
# Ubuntu/Linux setup
set -e

echo "Setting up dotfiles for Linux..."

sudo apt update
sudo apt install -y git curl build-essential

# helix
if ! command -v hx &>/dev/null; then
    echo "Installing Helix..."
    sudo add-apt-repository -y ppa:maveonair/helix-editor
    sudo apt update
    sudo apt install -y helix
fi

# zellij
if ! command -v zellij &>/dev/null; then
    echo "Installing Zellij..."
    ZELLIJ_VER=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep tag_name | cut -d '"' -f4)
    curl -fsSL "https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_VER}/zellij-x86_64-unknown-linux-musl.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/zellij /usr/local/bin/
    sudo chmod +x /usr/local/bin/zellij
fi

# lazygit
if ! command -v lazygit &>/dev/null; then
    echo "Installing lazygit..."
    LAZYGIT_VER=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/^v//')
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VER}/lazygit_${LAZYGIT_VER}_Linux_x86_64.tar.gz" | tar xz -C /tmp lazygit
    sudo mv /tmp/lazygit /usr/local/bin/
fi

echo "Linking configs..."
mkdir -p ~/.config/helix ~/.config/zellij

ln -sf ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -sf ~/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo ""
echo "Done! Run 'zellij' to start, 'hx .' to edit."
