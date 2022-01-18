function time_since_last_commit
  set ref (git symbolic-ref HEAD 2> /dev/null) || return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
end

function g
  if count $argv > /dev/null
    git "$argv"
  else
    echo "Last commit: (time_since_last_commit) ago"
    git status --short --branch
  end
end
