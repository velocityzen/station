function g -d "git"
  if test "$argv[1]" = "open"
    openwebgit
  else if test (count $argv) -gt 0
    git $argv
  else
    if test -z (git symbolic-ref HEAD 2> /dev/null)
      return
    end

    set -l minutes (git log -1 --pretty=format:"%ar" 2> /dev/null | sed 's/\([0-9]*\) \(.\).*/\1\2/')
    if test -n "$minutes"
      echo "Last commit: $minutes ago"
    end
    git status --short
  end
end
