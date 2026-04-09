#!/usr/bin/env bash

# macOS preferences (modern macOS 14+ / Sonoma & Sequoia)
# Run: bash osx.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing sudo timestamp
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set interface to Dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable smart quotes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic period with double spaces
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Hide Siri from menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

###############################################################################
# Trackpad, keyboard, and input                                               #
###############################################################################

# Enable full keyboard access for all controls (e.g. Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable Caps Lock on built-in keyboard (map Caps Lock to No Action)
defaults -currentHost write -g com.apple.keyboard.modifiermapping.0-0-0 -array \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771072</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer>
  </dict>'

# External keyboard (vendor:1241 product:1111): disable Caps Lock,
# swap Option/Command (for non-Mac keyboard layout), Globe -> fn
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1241-1111-0 -array \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771299</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771298</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771303</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771302</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771298</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771299</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771072</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>1095216660483</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>1095216660483</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>30064771302</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>30064771303</integer>
  </dict>' \
  '<dict>
    <key>HIDKeyboardModifierMappingDst</key><integer>1095216660483</integer>
    <key>HIDKeyboardModifierMappingSrc</key><integer>280379760050179</integer>
  </dict>'

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "pt-BR"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=BRL"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone
sudo systemsetup -settimezone "America/Sao_Paulo" > /dev/null

###############################################################################
# Window Management                                                           #
###############################################################################

# Disable Option-key tiling accelerator
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool false

###############################################################################
# Menu Bar                                                                    #
###############################################################################

# Clock: show AM/PM and day of week
defaults write com.apple.menuextra.clock ShowAMPM -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Set new Finder windows to open at Desktop
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand File Info panes: General, Open with, Sharing & Permissions
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable launch animation
defaults write com.apple.dock launchanim -bool false

# Hot corners
# Bottom left screen corner -> Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# Other corners -> nothing
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Energy                                                                      #
###############################################################################

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "cfprefsd" "Dock" "Finder" "SystemUIServer"; do
	killall "${app}" > /dev/null 2>&1
done

echo "Done. Some changes require a logout/restart to take effect."
