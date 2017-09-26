# Enable ALF
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
# Allow signed apps
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true
# Enable logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true
# Disable stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool false