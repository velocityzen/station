brew install asdf

mkdir -p ~/.config/fish/completions
asdf completion fish > ~/.config/fish/completions/asdf.fish

echo -e '\nset -gx ASDF_DATA_DIR "$HOME/.asdf"\nset -gx PATH $ASDF_DATA_DIR/shims $PATH' >> ~/.config/fish/config.fish
