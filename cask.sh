#!/usr/bin/env bash

# Install cask apps
function installcask() {
	brew install --cask "${@}" 2> /dev/null
}

brew tap homebrew/cask-fonts

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
installcask iterm2

# Others
installcask skype
installcask alacritty
installcask 1password
installcask notion
installcask slack
installcask charles
installcask mockoon
installcask anybar
installcask font-fira-code
