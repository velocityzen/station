function bu -d "Brew update and cleanup"
  brew update
  brew upgrade
  brew doctor
end
