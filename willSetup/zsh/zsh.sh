git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

sudo chsh -s /bin/zsh

if [ -f ~/.zshrc ]; then
  rm -f ~/.zshrc
fi
