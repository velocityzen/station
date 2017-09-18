function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

function cdf() {
  cd "$(pfd)"
}

function trash() {
  if [[ "$1" =~ ^[-]?[aA]{1}(ll)*$ ]]; then
      sudo rm -rvf ~/Library/Logs/*
      sudo rm -rvf /Library/Logs/*
      sudo rm -rvf /var/log/*
      sudo rm -rfv /Volumes/*/.Trashes
  elif [[ "$1" =~ ^[-]?[uU]{1}(ser)*$ ]]; then
      rm -rvf ~/Library/Logs/*
  fi
  rm -rfv ~/.Trash/*
  rm -rfv ~/.Trash/.*
  rm -rfv ~/Dropbox/.dropbox.cache
}

# IP addresses
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

alias p='cd ~/Projects'
alias d='cd ~/Downloads'

alias s='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl .'
alias ss='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias diff='git difftool'

alias webdev='open http://localhost:3000'
alias g='git'
alias o='open .'
alias oo='open'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

