#!/usr/bin/env bash

# Install cask apps
function installcask() {
	brew cask install "${@}" 2> /dev/null
}

# Browsers
installcask google-chrome
installcask torbrowser
installcask firefox

# Images
installcask imageoptim
installcask imagealpha

# Others
installcask skype
installcask alacritty
installcask 1password
installcask postman
installcask notion

# Database
installcask tableplus

# Code
installcask gpgtools
installcask anybar
installcask docker
