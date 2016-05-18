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
installcask alfred
installcask cleanmymac
installcask evernote
installcask transmit
installcask chromecast
installcask iterm2
installcask 1password

# Arduino
installcask arduino

# Raspberry Pi
installcask applepi-baker

# Database
installcask mongohub
installcask sequel-pro
installcask pgadmin3

# Code
installcask virtualbox
installcask dash
installcask android-studio
installcask wireshark
installcask anybar
installcask docker

