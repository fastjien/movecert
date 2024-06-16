#!/bin/bash

function main() {
  local zip_filename
  if [[ -n "$1" ]]; then
    zip_filename="movecert_$1.zip"
  else
    zip_filename="movecert.zip"
  fi
  if [[ -e "$zip_filename" ]]; then
    rm "$zip_filename"
    printf "delete ./%s" "$zip_filename"
  fi
  zip -r "$zip_filename" ./* -x 'venv/*' -x README.md
  printf ">>> Package to %s\n" "$zip_filename"
}

main "$@"
