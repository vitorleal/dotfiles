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
installcask cyberduck

# Database
installcask mongohub
installcask sequel-pro
installcask pgadmin3

# Code
installcask virtualbox
installcask dash
installcask dockertoolbox
installcask sublime-text-3
installcask postman
