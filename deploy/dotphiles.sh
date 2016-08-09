#!/usr/bin/env bash
#
# dotphiles : https://github.com/dotphiles/dotphiles
#
# Bootstrap dotphiles
#
# Authors:
#   Ben O'Hara <bohara@gmail.com>
#   Nathan Bellowe <nbellowe@gmail.com>
#

GITHUB_USERNAME="nbellowe"
DOTPHILES=$2

usage()
{
  echo
  echo "Usage: $0 github-username [.dotphiles]"
  echo
}

if [[ -z "$DOTPHILES" ]]; then
  DOTPHILES=".dotphiles"
fi

UPSTREAM="https://github.com/dotphiles/dotphiles"
ORIGIN="git@github.com:$GITHUB_USERNAME/dotphiles.git"

if [[ ! -d ~/$DOTPHILES ]]; then
  echo "Cloning $ORIGIN to ~/$DOTPHILES"
  git clone --recursive $ORIGIN ~/$DOTPHILES
  cd ~/$DOTPHILES
  git remote add upstream $UPSTREAM
  echo
  echo "***************************************************"
  echo "Done, edit ~/$DOTPHILES/dotsyncrc to enable dotfiles"
  echo "and symlink into place with dotsync -L"
fi

