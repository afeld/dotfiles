#!/bin/sh
# based on https://github.com/ahri/dotfiles/blob/master/write-links.sh
script="`readlink -f "$0"`"
dir="`dirname "$script"`"

find "$dir" -maxdepth 1 | while read file; do

  case "$file" in
    "$dir"|"$dir/.git"|"$dir/.gitignore"|"$dir/README.markdown"|*.swp|"$script")
      continue
      ;;
  esac
  
  name=".`basename $file`"
  rm -rf "$HOME/$name"
  ln -s "$file" "$HOME/$name"
done
