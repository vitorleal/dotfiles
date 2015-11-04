#!/usr/bin/env bash

# Install command-line tools using Homebrew.
brew update
brew upgrade --all

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
brew tap homebrew/dupes
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install python

# Install everything else.
brew inatall nmap
brew install ack
brew install git
brew install imagemagick
brew install tree
brew install webkit2png
brew install mongodb
brew install phantomjs
brew install lua
brew install nvm
brew install ffmpeg
brew install w3m
brew install mosquitto
brew install android-sdk
brew install homebrew/apache/ab
brew install jpeg
brew install x264
brew install lsusb
brew install ngrep
brew install postgresql
brew install postgis
brew install cloc
brew install youtube-dl

# Docker
brew install docker
brew install docker-compose

# Brew cask -  to install native apps
brew install phinze/cask/brew-cask
brew tap caskroom/versions

# Clean it up
brew cleanup

