brew install fish starship

echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

echo "/opt/homebrew/bin/starship init fish | source" | tee -a ~/.config/fish/config.fish
echo "source ~/.aliases" | tee -a ~/.config/fish/config.fish

for file in $PWD/willSetup/fish/functions/*.fish; do
  ln -s $file ~/.config/fish/functions
done

fish -c "fish_add_path /opt/homebrew/bin"
