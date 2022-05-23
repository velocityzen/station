function s -d "Opens directory or file in Sublime Text"
  if test (count $argv) -gt 0
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $argv
  else
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl .
  end
end
