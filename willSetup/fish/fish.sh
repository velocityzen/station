brew install fish starship

BREW_PREFIX=$(brew --prefix)
FISH_PATH=$(which fish)
STARSHIP_PATH=$(which starship)

echo "$FISH_PATH" | sudo tee -a /etc/shells
chsh -s $FISH_PATH

mkdir -p ~/.config/fish/functions
echo "set fish_greeting" | tee -a ~/.config/fish/config.fish
echo "set HOMEBREW_NO_ANALYTICS 1" | tee -a ~/.config/fish/config.fish
echo "set -gx XDG_CONFIG_HOME \"$HOME/.config\"" | tee -a ~/.config/fish/config.fish
echo "$STARSHIP_PATH init fish | source" | tee -a ~/.config/fish/config.fish
echo "source ~/.aliases" | tee -a ~/.config/fish/config.fish
echo "if test -e ~/.aliases.local
  source ~/.aliases.local
end
" | tee -a ~/.config/fish/config.fish

for file in $PWD/willSetup/fish/functions/*.fish; do
  ln -s $file ~/.config/fish/functions
done

fish -c "fish_add_path $BREW_PREFIX/bin"
fish -c "fish_add_path /usr/local/sbin"
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && \
  fisher install jorgebucaran/autopair.fish && \
  fisher install oh-my-fish/plugin-wifi-password && \
  fisher install oh-my-fish/plugin-aws"
