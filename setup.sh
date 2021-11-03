#!/bin/zsh
unsetopt nomatch

function CFPreferencesAppSynchronize() {
    python - <<END
from Foundation import CFPreferencesAppSynchronize
CFPreferencesAppSynchronize('$1')
END
}

HELPERS="$PWD/helpers"
SETUP_INDICATOR="💥"
DONE_INDICATOR="💻"

function runSetup {
  if [ -d ./$1/$2 ]; then
    if [ -f ./$1/$2/$2.sh ]; then
      SETUP=./$1/$2
      source ./$1/$2/$2.sh
    fi

    for file in $PWD/$1/$2/.* ; do
      ln -s $file ~
    done
  elif [ -f ./$1/$2.sh ]; then
    SETUP=./$1
    source ./$1/$2.sh
  fi
}

function processSetup {
  echo "\n$SETUP_INDICATOR  ${1%.sh}"
  runSetup willSetup ${1%.sh}
  runSetup setup ${1%.sh}
  runSetup didSetup ${1%.sh}
}

function processAll {
  for entry in ./$1/[^_]* ;do
    processSetup ${entry##*/}
  done
}

if [ "$1" ]; then
  processSetup $1
else
  processAll willSetup
  processAll setup
  processAll didSetup
fi

echo "$DONE_INDICATOR"

