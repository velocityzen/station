brew install fzf
(brew --prefix)/opt/fzf/install --no-bash --no-zsh
fisher install PatrickF1/fzf.fish
echo "set -x fzf_preview_dir_cmd eza --all --color=always" | tee -a ~/.config/fish/config.fish
echo "set -x FZF_DEFAULT_OPTS --height 50% --ansi --border --layout=reverse --margin=1 --padding=1" | tee -a ~/.config/fish/config.fish
