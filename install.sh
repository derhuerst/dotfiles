#!/bin/sh
# Symlinks the config files and sets up ZSH.



cd ~/.config
git submodule init
git submodule update



ln -s ~/.config/editorconfig/editorconfig ~/.editorconfig
ln -s ~/.config/git/gitignore             ~/.gitignore
ln -s ~/.config/git/gitconfig             ~/.gitconfig
ln -s ~/.config/homebrew/brew-aliases     ~/.brew-aliases
ln -s ~/.config/npm/npmrc                 ~/.npmrc
touch ~/.hushlogin



fisher # install things in fish/fishfile
