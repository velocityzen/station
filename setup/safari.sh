# # Appearance

# # Show status bar
# defaults write com.apple.Safari ShowStatusBar -bool true

# # Show favorites bar
# defaults write com.apple.Safari ShowFavoritesBar -bool true
# defaults write com.apple.Safari "ShowFavoritesBar-v2" -bool true

# # Don't show tab bar
# defaults write com.apple.Safari AlwaysShowTabBar -bool false


# # General settings

# # Safari opens with: A new window
# defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false

# # New windows open with: Empty Page
# defaults write com.apple.Safari NewWindowBehavior -int 1

# # New tabs open with: Empty Page
# defaults write com.apple.Safari NewTabBehavior -int 1

# # Homepage
# defaults write com.apple.Safari HomePage -string "about:blank"

# # Don't open "safe" files after downloading
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


# # Tabs settings

# # Open pages in tabs instead of windows: automatically
# defaults write com.apple.Safari TabCreationPolicy -int 1

# # Don't make new tabs active
# defaults write com.apple.Safari OpenNewTabsInFront -bool false

# # Command-clicking a link creates tabs
# defaults write com.apple.Safari CommandClickMakesTabs -bool true


# # Autofill settings

# # Don't remember passwords
# defaults write com.apple.Safari AutoFillPasswords -bool true


# # Security settings

# # Warn About Fraudulent Websites
# defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# # Enable plug-ins
# defaults write com.apple.Safari WebKitPluginsEnabled -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool true

# # Enable Java
# # defaults write com.apple.Safari WebKitJavaEnabled -bool true
# # defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool true

# # Enable JavaScript
# # defaults write com.apple.Safari WebKitJavaScriptEnabled -bool true
# # defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool true

# # Block pop-up windows
# defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# # Reading list
# defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2PluginsEnabled -bool false
# defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsImagesAutomatically -bool false
# defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsSiteIconsIgnoringImageLoadingPreference -bool true
# defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2JavaScriptEnabled -bool false


# # Privacy settings

# # Cookies and website data
# # - Always block
# #defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 2
# #defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 2

# # Website use of location services
# # 0 = Deny without prompting
# # 1 = Prompt for each website once each day
# # 2 = Prompt for each website one time only
# defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1

# # Do not track
# defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true


# # Notifications

# # Don't even ask about the push notifications
# # defaults write com.apple.Safari CanPromptForPushNotifications -bool false


# # Extensions settings

# # Update extensions automatically
# defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


# # Advanced settings

# # Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# # Make Safari’s search banners default to Contains instead of Starts With
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# # Enable the Develop menu and the Web Inspector in Safari
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# # Add a context menu item for showing the Web Inspector in web views
# # defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# CFPreferencesAppSynchronize "com.apple.Safari"
