brew install fish starship

echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

echo "/opt/homebrew/bin/starship init fish | source" | tee -a ~/.config/fish/config.fish
echo "source ~/.aliases" | tee -a ~/.config/fish/config.fish
echo "if test -e ~/.aliases.local
  source ~/.aliases.local
end
" | tee -a ~/.config/fish/config.fish

for file in $PWD/willSetup/fish/functions/*.fish; do
  ln -s $file ~/.config/fish/functions
done

fish -c "fish_add_path /opt/homebrew/bin"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/autopair.fish
fisher install oh-my-fish/plugin-wifi-password
fisher install oh-my-fish/plugin-aws
