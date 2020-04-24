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

# Database
installcask tableplus

# Code
installcask gpgtools
installcask docker
installcask postman
installcask insomnia

# Others
installcask skype
installcask alacritty
installcask 1password
installcask notion
installcask slack
installcask charles
installcask mockoon
installcask anybar

