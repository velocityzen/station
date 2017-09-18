brew cask install name-mangler

mkdir -p ~/Library/Services && cp "Rename comics.namemanglerservice" ~/Library/Services

# Concise list
defaults write com.manytricks.NameMangler "List Style" -int 0

# No icon previews
defaults write com.manytricks.NameMangler "Show Icon Previews" -bool false

# Quit when window closed
defaults write com.manytricks.NameMangler "Quit When Closed" -bool true

# Don't clear the list after processing
defaults write com.manytricks.NameMangler Repopulate -bool false

# No confirmation, just do it
defaults write com.manytricks.NameMangler Chicken -bool false
