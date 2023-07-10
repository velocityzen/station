function music -d "Find for music folder"
  fd --max-depth 1 $argv /Volumes/space/Music/ -X fd --max-depth 1 .
end
