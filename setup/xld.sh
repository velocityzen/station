brew install xld --cask

defaults write jp.tmkk.XLD OutputFormatName -string "FLAC;"
defaults write jp.tmkk.XLD XLDFlacOutput_CompressionLevel -int 8;
defaults write jp.tmkk.XLD XLDFlacOutput_AllowEmbeddedCueSheet -int 1;
defaults write jp.tmkk.XLD ForceReadCuesheet -int 1
defaults write jp.tmkk.XLD AutoQueryCDDB -int 1
defaults write jp.tmkk.XLD AutoSetCompilation -int 1
defaults write jp.tmkk.XLD MaxThreads -int 4
defaults write jp.tmkk.XLD Tagging -int 1
defaults write jp.tmkk.XLD CompressionQuality -int 70
defaults write jp.tmkk.XLD AutoLoadCover -int 1
defaults write jp.tmkk.XLD AutoLoadCoverDontOverwrite -int 1
defaults write jp.tmkk.XLD AutoLoadCoverName -string "cover.jpg folder.jpg front.jpg"
defaults write jp.tmkk.XLD AddiTunes -int 1
defaults write jp.tmkk.XLD EmbedImages -int 1
defaults write jp.tmkk.XLD ScalePixel -int 1200
defaults write jp.tmkk.XLD ScaleImage -int 1
defaults write jp.tmkk.XLD ScaleType -int 4
defaults write jp.tmkk.XLD 'NSToolbar Configuration XLDDiscViewToolbar' '{ "TB Default Item Identifiers" = ( "ExtractionMode", "NSToolbarFlexibleSpaceItem", "Extract", "GetMetadata", "EditMetadata", "Burn"); "TB Display Mode" = 2; "TB Icon Size Mode" = 2; "TB Is Shown" = 1; "TB Item Identifiers" = ( "GetMetadata", "NSToolbarFlexibleSpaceItem", "Extract" ); "TB Size Mode" = 1;}'
