# dotfiles

helix + zellij workflow. works on macOS and Ubuntu (GPU VMs over SSH).

> other tools i use on macOS:

1. [loop](https://github.com/MrKai77/Loop) for window management
2. [raycast](https://www.raycast.com/) to switch between apps
3. [alacritty](https://alacritty.org/) terminal

## quick start (SSH into a VM)

```bash
curl -fsSL https://raw.githubusercontent.com/saurabhaloneai/dotfiles/main/start.sh | bash
```

then just run `zellij` and you're in.

## manual setup

```bash
git clone https://github.com/saurabhaloneai/dotfiles.git ~/dotfiles
cd ~/dotfiles

# ubuntu
chmod +x setup.sh && ./setup.sh

# macOS
chmod +x setup-macos.sh && ./setup-macos.sh
```

## keybinds (zellij)

prefix is `Ctrl+a` (same as old tmux setup)

| key | action |
|-----|--------|
| `Ctrl+a \|` | split right |
| `Ctrl+a -` | split down |
| `Ctrl+a z` | fullscreen pane |
| `Ctrl+a x` | close pane |
| `Ctrl+a c` | new tab |
| `Ctrl+a n/p` | next/prev tab |
| `Ctrl+a r` | resize mode |
| `Ctrl+a s` | scroll mode |
| `Ctrl+a d` | detach |
| `Alt h/j/k/l` | move focus |
| `Alt n` | new pane |
| `Alt t` | new tab |
| `Alt 1-5` | go to tab |

## what's inside

```
helix/          helix editor config (gruvbox theme)
zellij/         zellij multiplexer config
nvim/           neovim config (lazy.nvim)
alacritty/      alacritty terminal config
setup.sh        ubuntu setup
setup-macos.sh  macOS setup
start.sh        one-liner bootstrap for VMs
```
