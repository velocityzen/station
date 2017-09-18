source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

zplug "plugins/cask",   		from:oh-my-zsh
zplug "plugins/npm",   			from:oh-my-zsh
zplug "plugins/sudo",   		from:oh-my-zsh
zplug "plugins/torrent",   		from:oh-my-zsh
zplug "plugins/xcode",   		from:oh-my-zsh
zplug "themes/sorin", as:theme, from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

source ~/.aliases
