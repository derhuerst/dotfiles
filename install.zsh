#!/bin/zsh
# Symlinks the config files and sets up ZSH.



ln -s	~/.config/editorconfig/editorconfig	~/.editorconfig
ln -s	~/.config/git/gitignore				~/.gitignore
ln -s	~/.config/git/gitconfig				~/.gitconfig
ln -s	~/.config/npm/npmrc					~/.npmrc
ln -s	~/.config/git/irbrc					~/.irbrc
ln -s	~/.config/zsh/zshrc					~/.zshrc
touch	~/.hushlogin



source ~/.config/zsh/zshrc



# rebuild ZSH completion index
rm -f ~/.zcompdump
autoload -Uz compinit
compinit
