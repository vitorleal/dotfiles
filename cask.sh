#!/usr/bin/env bash

# Install cask apps
function installcask() {
	brew cask install "${@}" 2> /dev/null
}

# Browsers
installcask google-chrome
installcask torbrowser
installcask firefox

# Essentials
installcask iterm2

# Others
installcask google-drive
installcask transmission
installcask skype
installcask evernote
installcask transmit
installcask chromecast
installcask vlc
installcask spotify
installcask telegram
installcask evernote
installcask transmit
installcask chromecast

# Arduino
installcask arduino

# Database
installcask mongohub
installcask sequel-pro

# Code
installcask dash
installcask dockertoolbox
installcask sublime-text-3
installcask postman
installcask java
installcask android-studio
installcask anybar
installcask docker
