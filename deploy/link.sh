#!/usr/bin/env bash

echo "Assuming location is ~/.dotfiles"
for file in ~/.dotfiles/.*
do
  if [[ "$file" == *".git" ]] ||
     [[ "$file" == *".CFUserTextEncoding" ]] ||
     [[ "$file" == *".DS_Store" ]] ||
     [[ "$file" == *".Trash" ]] ||
     [[ "$file" == *".." ]] ||
     [[ "$file" == *"." ]]
  then
    echo "Skipping " $file;
  else
    echo "Linking " $file
    ln -s "$file" "$HOME"
  fi
done
