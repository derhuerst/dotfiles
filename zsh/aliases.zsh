#!/bin/zsh
# Set up handy command aliases in ZSH.



# file management

alias ls='ls -AFGpa'
alias lsa='ls -AFGhlop'
function lsr() {
	tree -fFiCa -L 4 --dirsfirst --sort=name $@ | tail -n +2
}

alias -g ...='../..'
alias -g ....='../../..'

# `o file.txt`: open file in default app
# `o http://example.com`: open URL in default browser
# `o` open pwd in Finder
alias o='open'

alias md='mkdir -p'
alias rd='rmdir'
function mdcd() {
	mkdir -p "$@"
	cd "$_"
}

alias -- +x='chmod +x'
alias -- -x='chmod -x'



# search

alias spl='mdfind -onlyin .'

alias grep="grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}"
alias -g G='| grep'



# frequently used directories

alias -g medien='/Volumes/Medien'
alias -g md=medien
alias -g downloads='~/Downloads/'
alias -g dl=downloads
alias -g web='~/Web/'
alias -g home='~'



# Git

alias git='hub'
alias g='git'

# the sub command aliases are defined in ~/.gitconfig



# HomeBrew

alias b='brew'

alias brews='brew list'
brew alias u='update'
brew alias i='install'
brew alias s='search'



# http-server

alias serve='http-server'
alias sv=serve



# REPLs

alias js='node'
alias cff='coffee'
alias rb='irb'
alias py='python'
alias py='python'



# miscellaneous

alias sd='sudo'
