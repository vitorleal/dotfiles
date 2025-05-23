#!/usr/bin/env bash

# Install cask apps
function installcask() {
  brew install --cask "${@}" 2>/dev/null
}

brew tap homebrew/cask-fonts

# Browsers
installcask google-chrome
installcask torbrowser

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
installcask flutter
installcask rio
installcask lm-studio

# Others
installcask 1password
installcask notion
installcask slack
installcask charles
installcask anybar
installcask font-fira-code
installcask fantastical
installcask whatsapp
installcask moom
installcask chatgpt
installcask gpg-suite
