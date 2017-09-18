#!/bin/zsh
HELPERS="$PWD/helpers"
SETUP_INDICATOR="💥"

function runSetup {
  if [ -d ./$1/$2 ]; then
    if [ -f ./$1/$2/$2.sh ]; then
      source ./$1/$2/$2.sh
    fi
    cp ./$1/$2/.* ~/
  elif [ -f ./$1/$2.sh ]; then
    source ./$1/$2.sh
  fi
}

function processSetup {
  echo "$SETUP_INDICATOR  ${1%.sh}"
  runSetup willSetup $1
  runSetup setup $1
  runSetup didSetup $1
}

function processAll {
  for entry in ./$1/*.sh ;do
    processSetup ${entry##*/}
  done
}


if [ "$1" ]; then
  processSetup $1
  echo "💻"
  exit
fi

processAll willSetup
processAll setup
processAll didSetup
