#!/bin/sh

cd ~/.config
git submodule init
git submodule update

ln -s ~/.config/editorconfig/editorconfig ~/.editorconfig
ln -s ~/.config/git/gitignore             ~/.gitignore
ln -s ~/.config/git/gitconfig             ~/.gitconfig
ln -s ~/.config/homebrew/brew-aliases     ~/.brew-aliases
ln -s ~/.config/npm/npmrc                 ~/.npmrc
ln ~/.config/conductor/index.js        ~/.conductor.js
touch ~/.hushlogin



fish fish/install.fish
fish npm/install.fish
