#!/usr/bin/env bash

# Install command-line tools using Homebrew.
brew update
brew upgrade

###############################################################################
# Core utilities                                                              #
###############################################################################

brew install coreutils
brew install moreutils
brew install findutils
brew install bash
brew install bash-completion@2
brew install wget
brew install vim
brew install grep
brew install openssh
brew install tree

###############################################################################
# Development tools                                                           #
###############################################################################

brew install git
brew install gh
brew install neovim
brew install asdf
brew install gitleaks
brew install cloc

###############################################################################
# Modern CLI replacements                                                     #
###############################################################################

brew install ripgrep     # grep replacement
brew install fd          # find replacement
brew install bat         # cat replacement
brew install zoxide      # cd replacement
brew install fzf         # fuzzy finder
brew install jq          # JSON processor
brew install lazygit     # git TUI
brew install gum         # interactive shell scripts

###############################################################################
# Terminal & multiplexer                                                      #
###############################################################################

brew install zellij
brew install spaceship

###############################################################################
# Networking & security                                                       #
###############################################################################

brew install nmap
brew install doggo
brew install tailscale

###############################################################################
# Media                                                                       #
###############################################################################

brew install imagemagick
brew install ffmpeg
brew install jpeg
brew install x264

###############################################################################
# Monitoring                                                                  #
###############################################################################

brew install htop
brew install glances
brew install ctop

###############################################################################
# Utilities                                                                   #
###############################################################################

brew install tldr
brew install terminal-notifier
brew install bruno
brew install models
brew install w3m
brew install ack
brew install pinentry-mac
brew install claude

# Clean it up.
brew cleanup
