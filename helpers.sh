#!/usr/bin/env bash

ex_repl () {
  if [[ $1 == haskell/* ]]; then
    # we need to check into the folder to let stack access its env
    ( cd "$1" && stack ghci )
  elif [[ $1 == ruby/* ]]; then
    ( cd "$1" && irb )
  elif [[ $1 == bash/* ]]; then
    "Dude. You're in a shell."
  else
    echo Not implemented
  fi
}

ex_test () {
  if [[ $1 == haskell/* ]]; then
    # we need to check into the folder to let stack access its env
    ( cd "$1" && stack test --file-watch )
  elif [[ $1 == ruby/* ]]; then
    ( cd "$1" && find *.rb | entr -c -r ruby *_test.rb -p )
  elif [[ $1 == bash/* ]]; then
    ( cd "$1" && find *.sh | entr -c -r bats -p *_test.sh )
  elif [[ $1 == clojure/* ]]; then
    ( cd "$1" && find *.clj | entr -c -r lein test )
  else
    echo Not implemented
  fi
}

ex_solve () {
  git add "${1%/}"
  git commit -m "solve ${1%/}"
  git push
}

ex_feedback () {
  git add "${1%/}"
  git commit -m "apply feedback to ${1%/}"
  git push
}