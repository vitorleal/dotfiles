#!/usr/bin/env bash

# Install cask apps
function installcask() {
	brew cask install "${@}" 2> /dev/null
}

# Browsers
installcask google-chrome
installcask google-chrome-canary
installcask torbrowser
installcask firefox

# Images
installcask imageoptim
installcask imagealpha

# Others
installcask google-drive
installcask transmission
installcask skype
installcask cleanmymac
installcask evernote
installcask transmit
installcask chromecast
installcask iterm2
installcask 1password

# Arduino
installcask arduino

# Database
installcask mongohub
installcask sequel-pro

# Code
installcask virtualbox
installcask dash
installcask android-studio
installcask anybar
installcask docker
installcask charles

