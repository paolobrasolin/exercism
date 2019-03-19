#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./error_handling <greetee>"
  exit 1
else
  echo "Hello, ${1}"
fi
