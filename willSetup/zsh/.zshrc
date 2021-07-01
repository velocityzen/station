fpath=(/usr/local/share/zsh/site-functions $fpath)

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/asdf
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/torrent
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/doctl
    zgen oh-my-zsh plugins/xcode
    zgen oh-my-zsh plugins/transfer
    zgen oh-my-zsh plugins/command-not-found

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions

    zgen load lukechilds/zsh-nvm
    zgen load wfxr/forgit

    # theme
    zgen oh-my-zsh themes/sorin

    # save all to init script
    zgen save
    rm -f ~/.zcompdump; compinit
fi

source ~/.aliases

# esp
export PATH=$HOME/Projects/esp/xtensa-esp32-elf/bin:$PATH
export IDF_PATH=$HOME/Projects/esp/esp-idf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER='~~'
