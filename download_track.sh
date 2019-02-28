#!/usr/bin/env bash
curl -sSL "https://exercism.io/tracks/$1/exercises" \
  | grep "/tracks/$1/exercises/" \
  | cut -d/ -f5 \
  | cut -d\" -f1 \
  | while read -r ex; do exercism download --exercise="$ex" --track="$1"; done
