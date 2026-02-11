#!/bin/bash
# One-liner: curl -fsSL https://raw.githubusercontent.com/saurabhaloneai/dotfiles/main/start.sh | bash
set -e

OS="$(uname -s)"

echo "==> detected: $OS"

# ---- install packages ----
if [ "$OS" = "Linux" ]; then
    sudo apt update
    sudo apt install -y git curl build-essential

    # helix
    if ! command -v hx &>/dev/null; then
        echo "==> installing helix..."
        sudo add-apt-repository -y ppa:maveonair/helix-editor
        sudo apt update
        sudo apt install -y helix
    fi

    # zellij
    if ! command -v zellij &>/dev/null; then
        echo "==> installing zellij..."
        ZELLIJ_VER=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep tag_name | cut -d '"' -f4)
        curl -fsSL "https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_VER}/zellij-x86_64-unknown-linux-musl.tar.gz" | tar xz -C /tmp
        sudo mv /tmp/zellij /usr/local/bin/
        sudo chmod +x /usr/local/bin/zellij
    fi

    # lazygit
    if ! command -v lazygit &>/dev/null; then
        echo "==> installing lazygit..."
        LAZYGIT_VER=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/^v//')
        curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VER}/lazygit_${LAZYGIT_VER}_Linux_x86_64.tar.gz" | tar xz -C /tmp lazygit
        sudo mv /tmp/lazygit /usr/local/bin/
    fi

elif [ "$OS" = "Darwin" ]; then
    if ! command -v brew &>/dev/null; then
        echo "==> installing homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install helix zellij lazygit
else
    echo "unsupported OS: $OS" && exit 1
fi

# ---- clone dotfiles ----
if [ ! -d ~/dotfiles ]; then
    echo "==> cloning dotfiles..."
    git clone https://github.com/saurabhaloneai/dotfiles.git ~/dotfiles
else
    echo "==> dotfiles already exists, pulling latest..."
    git -C ~/dotfiles pull
fi

# ---- symlink configs ----
echo "==> linking configs..."
mkdir -p ~/.config/helix ~/.config/zellij

ln -sf ~/dotfiles/helix/config.toml ~/.config/helix/config.toml
ln -sf ~/dotfiles/helix/languages.toml ~/.config/helix/languages.toml
ln -sf ~/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl

echo ""
echo "done! start working:"
echo "  zellij    # multiplexer"
echo "  hx .      # editor"
