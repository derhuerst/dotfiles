#!/bin/bash



# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# install node & npm
brew install node

# install utilities
brew install ssh-copy-id wget unrar git

# install node utilities
npm install -g spot coffee-script http-server

# clean up
brew cleanup
rm -rf ~/.npm
rm -rf ~/.node-gyp