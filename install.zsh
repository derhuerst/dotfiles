#!/bin/zsh
# Symlinks the config files and sets up ZSH.



cd ~/.config
git submodule init
git submodule update



ln -s	~/.config/editorconfig/editorconfig	~/.editorconfig
ln -s	~/.config/git/gitignore				~/.gitignore
ln -s	~/.config/git/gitconfig				~/.gitconfig
ln -s	~/.config/homebrew/brew-aliases		~/.brew-aliases
ln -s	~/.config/npm/npmrc					~/.npmrc
ln -s	~/.config/zsh/zshrc					~/.zshrc
ln -s	~/.config/bash/bash_profile			~/.bash_profile
touch	~/.hushlogin



# rebuild ZSH completion index
source ~/.config/zsh/zshrc
rm -f ~/.zcompdump
autoload -Uz compinit
compinit
