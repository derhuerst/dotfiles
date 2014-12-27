#!/bin/bash
# This script helps making OS X hacker friendly. It
# - deactivates all sorts of animations
# - shows hidden files
# - optimizes the Finder
# - hides the Dock



printHeading () {
	printf "\n\033[38;5;67m$@\n\n"
}
printText () {
	printf "\n\033[0m$@"
}
printLog () {
	printf "\n\033[90m$@"
}
printCheck () {
	printf ' \033[38;5;112m✓\n'
}



printText 'Some customizations require root priveledges. Please enter your password.\n'
sudo -v
printText 'Thanks.'



# General
printHeading 'General'

printLog 'Increase window resize speed for Cocoa applications.'
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
printCheck

printLog 'Do not restore windows after ⌘ + Q.'
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
printCheck

printLog 'Disable menu bar transparency.'
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
printCheck

printLog 'Top right screen corner → Activate screen saver.'
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0
printCheck

printLog 'Expand save panel by default.'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
printCheck

printLog 'Disable the warning when file extensions.'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
printCheck

printLog 'Show hard drives, servers, and removables on the desktop.'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
printCheck



# System
printHeading 'System'

printLog 'Show all processes in Activity Monitor.'
defaults write com.apple.ActivityMonitor ShowCategory -int 0
printCheck

printLog 'Sort Activity Monitor results by CPU usage.'
defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage'
defaults write com.apple.ActivityMonitor SortDirection -int 0
printCheck

printLog 'Disable hibernation.'
sudo pmset -a hibernatemode 0
printCheck

printLog 'Remove the sleep image file to save disk space…'
sudo rm /Private/var/vm/sleepimage
printCheck

printLog 'and create a zero-byte file instead.'
sudo touch /Private/var/vm/sleepimage
sudo chflags uchg /Private/var/vm/sleepimage
printCheck

printLog 'Disable local Time Machine backups.'
hash tmutil &> /dev/null && sudo tmutil disablelocal
printCheck

printLog 'Do not ask to use new hard drives as Time Machine volume.'
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
printCheck

printLog 'Disable disk image verification.'
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
printCheck

printLog 'Disable the "Are you sure you want to open this application?" check.'
defaults write com.apple.LaunchServices LSQuarantine -bool false
printCheck

printLog 'Enable HiDPI display modes.'
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
printCheck

printLog 'Show the ~/Library folder.'
chflags nohidden ~/Library
printCheck



# Miscellaneous
printHeading 'Miscellaneous'

printLog 'Enable AirDrop over Ethernet.'
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
printCheck

printLog 'Disable the warning before emptying the Trash.'
defaults write com.apple.finder WarnOnEmptyTrash -bool false
printCheck

printLog 'Automatically quit printer app once the print jobs complete.'
defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true
printCheck

printLog 'Avoid creating .DS_Store files on network volumes.'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
printCheck

printLog 'Change screenshot location.'
defaults write com.apple.screencapture location ~/Downloads/
printCheck

printLog 'Save screenshots in PNG format.'
defaults write com.apple.screencapture type -string 'png'
printCheck

printLog 'Save to disk (not to iCloud) by default.'
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
printCheck

printLog 'Disable send and reply animations in Mail.app.'
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
printCheck

printLog 'Add a Web Inspector context menu item in web views.'
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
printCheck

printLog 'Enable snap-to-grid for desktop icons.'
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist
printCheck



# Spotlight
printHeading 'Spotlight'

printLog 'Hide useless things in Spotlight.'
defaults write com.apple.spotlight orderedItems -array \
'{"enabled" = 1;"name" = "APPLICATIONS";}' \
'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
'{"enabled" = 1;"name" = "DIRECTORIES";}' \
'{"enabled" = 1;"name" = "PDF";}' \
'{"enabled" = 1;"name" = "DOCUMENTS";}' \
'{"enabled" = 1;"name" = "MESSAGES";}' \
'{"enabled" = 1;"name" = "CONTACT";}' \
'{"enabled" = 1;"name" = "EVENT_TODO";}' \
'{"enabled" = 1;"name" = "IMAGES";}' \
'{"enabled" = 1;"name" = "MUSIC";}' \
'{"enabled" = 1;"name" = "MOVIES";}' \
'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
'{"enabled" = 1;"name" = "SOURCE";}' \
'{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
'{"enabled" = 0;"name" = "FONTS";}' \
'{"enabled" = 0;"name" = "BOOKMARKS";}' \
'{"enabled" = 0;"name" = "MENU_OTHER";}' \
'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
printCheck

printLog 'Restart Spotlight.'
killall mds > /dev/null 2>&1
printCheck

printLog 'Make sure indexing is enabled for the main volume.'
sudo mdutil -i on / > /dev/null
printCheck

printLog 'Rebuild the index from scratch.'
sudo mdutil -E / > /dev/null
printCheck



# Dock
printHeading 'Dock'

printLog 'Disable the dock show/hide animation.'
defaults write com.apple.dock autohide-time-modifier -float 0
printCheck

printLog 'Enable spring loading for all Dock items.'
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
printCheck

printLog 'Show indicator lights for open applications in the Dock.'
defaults write com.apple.dock show-process-indicators -bool true
printCheck

printLog 'Set the icon size of Dock items to 46 pixels.'
defaults write com.apple.dock tilesize -int 46
printCheck

printLog 'Add some spacers to the Dock for you to rearrange..'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
printCheck

printLog 'Automatically hide and show the Dock.'
defaults write com.apple.dock autohide -bool true
printCheck

printLog 'Remove the auto-hiding Dock delay.'
defaults write com.apple.dock autohide-delay -float 0
printCheck

printLog 'Disable the animation when hiding/showing the Dock.'
defaults write com.apple.dock autohide-time-modifier -float 0
printCheck

printLog 'Change minimize/maximize window effect to scaling..'
defaults write com.apple.dock mineffect -string 'scale'
printCheck



# Mission Control
printHeading 'Mission Control'

printLog 'Disable Dashboard.'
defaults write com.apple.dashboard mcx-disabled -bool true
printCheck

printLog 'Don’t show Dashboard as a Space.'
defaults write com.apple.dock dashboard-in-overlay -bool true
printCheck

printLog 'Speed up Mission Control animations.'
defaults write com.apple.dock expose-animation-duration -float 0
printCheck

printLog 'Don’t automatically rearrange Spaces based on most recent use.'
defaults write com.apple.dock mru-spaces -bool false
printCheck



# Keyboard & Mouse
printHeading 'Keyboard & Mouse'

printLog 'Set a fast keyboard repeat rate.'
defaults write NSGlobalDomain KeyRepeat -int 1.5
printCheck

printLog 'Set a short Delay until key repeat.'
defaults write NSGlobalDomain InitialKeyRepeat -int 15
printCheck

printLog 'Trackpad: enable tap to click.'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
printCheck



# Safari
printHeading 'Safari'

printLog 'Safari: Show the full URL in the address bar.'
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
printCheck

printLog 'Safari: Don’t send search queries to Apple.'
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
printCheck

printLog 'Set Safari’s home page to `about:blank`.'
defaults write com.apple.Safari HomePage -string 'about:blank'
printCheck

printLog 'Disable Safari’s thumbnail cache for History and Top Sites.'
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
printCheck

printLog 'Enable Safari’s debug menu.'
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
printCheck

printLog 'Remove useless icons from Safari’s bookmarks bar.'
defaults write com.apple.Safari ProxiesInBookmarksBar '()'
printCheck



# Finder
printHeading 'Finder'

printLog 'Open a new window when a volume is mounted.'
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
printCheck

printLog 'Display full path as window title.'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
printCheck

printLog 'Show the status bar.'
defaults write com.apple.finder ShowStatusBar -bool true
printCheck

printLog 'Open new windows with ~/Downloads.'
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string 'file://${HOME}/Downloads/'
printCheck

printLog 'Use current directory as default search scope.'
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
printCheck

printLog 'Allow text selection in Quick Look.'
defaults write com.apple.finder QLEnableTextSelection -bool true
printCheck

printLog 'Enable spring loading for directories.'
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
printCheck

printLog 'Remove the spring loading delay for directories.'
defaults write NSGlobalDomain com.apple.springing.delay -float 0
printCheck

printLog 'Show hidden files.'
defaults write com.apple.finder AppleShowAllFiles -bool true
printCheck

printLog 'Show all filename extensions.'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
printCheck

printLog 'Make column view the default.'
defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'
printCheck



printText 'Save all your work now! Continue by hitting return.'
read -p ''

for app in 'Activity Monitor' 'Address Book' 'Calendar' 'Contacts' 'cfprefsd' \
'Dock' 'Finder' 'Mail' 'Messages' 'Safari' 'SizeUp' 'SystemUIServer' \
'Terminal' 'Transmission' 'Twitter' 'iCal'; do
	killall $app > /dev/null 2>&1
done

printText 'Done, you should restart now. Have fun! 🍺\n'