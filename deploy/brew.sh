#!/usr/bin/env bash

if ! [[ -x "$(command -v brew)" ]]; then 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

#install these manually…
# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

if [[ -f packages/homebrew ]]; then
  exec<packages/homebrew
  while read line
  do
    if [[ ! "$line" =~ (^#|^$) ]]; then
      brew install $line
    fi
  done
fi

if [[ -f packages/homebrewcasks ]]; then
  exec<packages/homebrewcasks
  while read line
  do
    if [[ ! "$line" =~ (^#|^$) ]]; then
      brew cask install $line
    fi
  done
fi

# Remove outdated versions from the cellar. (happened once)
brew cleanup