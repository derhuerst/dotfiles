#!/bin/zsh
# Symlinks the config files and sets up ZSH.



brew alias u='update'
brew alias i='install'
brew alias s='search'



cd ~/.config
git submodule init
git submodule update



ln -s	~/.config/editorconfig/editorconfig	~/.editorconfig
ln -s	~/.config/git/gitignore				~/.gitignore
ln -s	~/.config/git/gitconfig				~/.gitconfig
ln -s	~/.config/npm/npmrc					~/.npmrc
ln -s	~/.config/zsh/zshrc					~/.zshrc
ln -s	~/.config/bash/bash_profile			~/.bash_profile
touch	~/.hushlogin



# rebuild ZSH completion index
source ~/.config/zsh/zshrc
rm -f ~/.zcompdump
autoload -Uz compinit
compinit
