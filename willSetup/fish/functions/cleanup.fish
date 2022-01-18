function cleanup -d "Cleanup system and user logs, empty trash"
  set -l logs ~/Library/Logs/* /Library/Logs/* /var/log/*
  if count $logs > /dev/null
      sudo rm -rf $logs
  end

  set -l trash /Volumes/*/.Trashes ~/.Trash/* ~/.Trash/.*
  if count $trash > /dev/null
      sudo rm -rf $trash
  end
end
