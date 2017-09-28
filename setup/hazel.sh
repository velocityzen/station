brew cask install hazel

defaults write com.noodlesoft.Hazel ShowStatusInMenuBar -bool false
defaults write com.noodlesoft.Hazel IgnoreGrowl -int 1
defaults write com.noodlesoft.Hazel NotificationCategories -array 'Error'

open ~/Dropbox/Apps/Hazel/
