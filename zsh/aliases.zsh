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
function mkcd() {
	mkdir -p "$@"
	cd "$_"
}

alias -- +x='chmod +x'
alias -- -x='chmod -x'



# search

alias spl='mdfind -onlyin .'

alias grep="grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}"
alias -g G='| grep -A 2 -B 2'
alias -g G0='| grep'



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

alias npmls='npm ls --depth 0'

alias sd='sudo'
# tell sub bash shells to use the `~/.bash_profile`
alias bash='bash -l'
# Pretty print the path
# todo: move to ~/bin?
alias path='echo $PATH | tr -s ":" "\n"'
# credits: https://github.com/sivel/speedtest-cli
alias speedtest='speedtest --simple --bytes'
