curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

cp aliases.zsh ~/.zplug
zplug install
