fpath=(/usr/local/share/zsh/site-functions $fpath)

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/torrent
    zgen oh-my-zsh plugins/xcode
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions

    # theme
    zgen oh-my-zsh themes/sorin

    # save all to init script
    zgen save
    rm -f ~/.zcompdump; compinit
fi

source ~/.transfer
source ~/.aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
