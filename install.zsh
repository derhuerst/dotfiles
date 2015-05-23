#!/bin/zsh
# Symlinks the config files and sets up ZSH.



ln -s	~/.config/editorconfig/editorconfig	~/.editorconfig
ln -s	~/.config/git/gitignore				~/.gitignore
ln -s	~/.config/git/gitconfig				~/.gitconfig
ln -s	~/.config/npm/npmrc					~/.npmrc
ln -s	~/.config/git/irbrc					~/.irbrc
ln -s	~/.config/zsh/zshrc					~/.zshrc
touch	~/.hushlogin



# rebuild ZSH completion index
source ~/.config/zsh/zshrc
rm -f ~/.zcompdump
autoload -Uz compinit
compinit
