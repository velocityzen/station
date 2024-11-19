brew install transmission --cask

defaults write org.m0k.transmission BlocklistURL -string "http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission DownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadLocationConstant -bool true
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"
defaults write org.m0k.transmission RatioLimit -float 2.0
defaults write org.m0k.transmission IdleLimitCheck -bool true
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission SmallView -bool true
defaults write org.m0k.transmission RatioCheck -bool true
defaults write org.m0k.transmission PeersTotal -int 400
defaults write org.m0k.transmission PeersTorrent -int 60
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission PlayDownloadSound -bool false
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
defaults write org.m0k.transmission WarningRemoveCompleted -bool false
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
defaults write org.m0k.transmission StatusBar -bool false
defaults write org.m0k.transmission "NSToolbar Configuration TRMainToolbar" "TB Is Shown" -int 0
defaults write org.m0k.transmission BadgeDownloadRate -bool false
defaults write org.m0k.transmission BadgeUploadRate -bool false
