function g -d "git"
  if not set -q $argv
    git $argv
  else
    if test -z (git symbolic-ref HEAD 2> /dev/null)
      return
    end

    set -l minutes (git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/')
    echo "Last commit: $minutes ago"
    git status --short --branch
  end
end
