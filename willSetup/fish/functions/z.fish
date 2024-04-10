function z -d "Opens directory or file in Zed"
  if test (count $argv) -gt 0
    /Applications/Zed.app/Contents/MacOS/Zed $argv
  else
    /Applications/Zed.app/Contents/MacOS/Zed .
  end
end
