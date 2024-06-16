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
    printf ">>> delete ./%s\n" "$zip_filename"
  fi
  #  zip -q -r "$zip_filename" . -x 'venv/*' -x '.git/*' -x '.idea/*' -x 'package_module.sh' -x README.md
  zip -q -r "$zip_filename" common META-INF system .gitattributes install.sh module.prop
  printf ">>> Package to %s\n" "$zip_filename"
}

main "$@"
