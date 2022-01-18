function cleanup -d "Cleanup system and user logs, empty trash"
  set -l logs ~/Library/Logs/* /Library/Logs/* /var/log/*
  if test (count $logs) -gt 1
      sudo rm -rf "$logs"
      echo "Deleted logs:"
      for log in $logs
        echo "  $log"
      end
  end

  set -l trash /Volumes/*/.Trashes ~/.Trash/* ~/.Trash/.*
  if test (count $trash) -gt 1
      sudo rm -rf "$trash"
      echo "Emptied trash:"
      for file in $trash
        echo "  $file"
      end
  end
end
