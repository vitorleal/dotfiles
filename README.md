# .dotfiles

[![Dotfiles](https://img.shields.io/badge/dot-files-green.svg)](https://dotfiles.github.io/)

My macOS development environment setup — terminal, editor, shell, and system preferences.

## What's included

| Category | Tools |
|----------|-------|
| Terminal | [Ghostty](https://ghostty.org) + [Zellij](https://zellij.dev) |
| Shell | Zsh + [Oh My Zsh](https://ohmyz.sh) + [Spaceship](https://spaceship-prompt.sh) prompt |
| Editor | [Neovim](https://neovim.io) ([LazyVim](https://www.lazyvim.org)) |
| Font | [Fira Code](https://github.com/tonsky/FiraCode) (Nerd Font) |
| Theme | Tokyo Night |

## Quick start

The installer uses [gum](https://github.com/charmbracelet/gum) for an interactive GUI where you can choose what to install.

```sh
bash install.sh
```

It will prompt you to select from:

- **Dotfiles** — copy shell, git, and app configs to `$HOME`
- **Git Config** — set your name, email, and GPG signing key
- **CLI Tools** — install command-line tools via Homebrew (`brew.sh`)
- **GUI Apps** — install desktop apps via Homebrew Cask (`cask.sh`)
- **Oh My Zsh** — install Oh My Zsh and Spaceship prompt if not present
- **Languages (asdf)** — install latest Go, Node.js, Elixir, and Rust via asdf
- **macOS Preferences** — apply system defaults (`osx.sh`)

## Files

```
.aliases            # Shell aliases and functions
.exports            # Environment variables and PATH
.zshrc              # Zsh configuration
.gitconfig          # Git aliases, colors, and settings
.gitignore          # Global gitignore
.gnupg/             # GPG agent configuration
.config/ghostty/    # Ghostty terminal config
.config/nvim/       # Neovim (LazyVim) config
.config/zellij/     # Zellij multiplexer config
brew.sh             # CLI tools (Homebrew)
cask.sh             # GUI apps (Homebrew Cask)
osx.sh              # macOS system preferences
install.sh          # Interactive installer
```

## Individual scripts

Install only CLI tools:

```sh
bash brew.sh
```

Install only GUI apps:

```sh
bash cask.sh
```

Apply only macOS preferences:

```sh
bash osx.sh
```

## Author

[Vitor Leal](https://github.com/vitorleal)
