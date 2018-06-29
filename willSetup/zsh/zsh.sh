if [ ! -d ~/.zgen ]; then
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

sudo chsh -s /bin/zsh

if [ -f ~/.zshrc ]; then
  rm -f ~/.zshrc
fi

if [ -f ~/.aliases ]; then
  rm -f ~/.aliases
fi

if [ -f ~/.transfer ]; then
  rm -f ~/.transfer
fi
