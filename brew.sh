#!/usr/bin/env bash

# Install command-line tools using Homebrew.
brew update
brew upgrade

# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install bash
brew install wget --with-iri
brew install bash-completion

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep
brew install openssh
brew install screen
brew install python

# Install everything else.
brew install git
brew install go
brew install nmap
brew install ack
brew install imagemagick
brew install tree
brew install ffmpeg
brew install w3m
brew install android-sdk
brew install jpeg
brew install x264
brew install cloc
brew install tldr
brew install gh
brew install ctop
brew install gitleaks
brew install doggo
# Rip Grep
brew install rg
# Find replace
brew install fd
# Cat replace
brew install bat
brew install htop
brew install glances
brew install asdf
brew install tmux
brew install spaceship

# Clean it up.
brew cleanup
