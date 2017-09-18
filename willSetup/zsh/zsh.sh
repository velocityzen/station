curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

sudo chsh -s /bin/zsh

if [ -f ~/.zshrc ]; then
  rm -f ~/.zshrc
fi
