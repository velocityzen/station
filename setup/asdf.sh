brew install asdf

BREW_PREFIX=$(brew --prefix asdf)

echo -e "\nsource "$BREW_PREFIX"/libexec/asdf.fish" >> ~/.config/fish/config.fish
