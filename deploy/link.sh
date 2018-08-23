#!/usr/bin/env bash

echo "Assuming location is ~/.dotfiles"

for file in .*
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
    echo "Linking " $file ln -s "$PWD/$file" $HOME
    ln -s "$PWD/$file" $HOME
    #echo rm $HOME/$file
    #rm $HOME/$file
  fi
done
