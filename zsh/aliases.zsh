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
alias rmr='rmdir'
function mkcd() {
	mkdir -p "$@"
	cd "$_"
}

alias -- +x='chmod +x'
alias -- -x='chmod -x'

alias tree='tree -axC -L 4 -I ".git|node_modules"'



# search

alias spl='mdfind -onlyin .'
alias spot='spot -e node_modules'
function fuz() {
	file=$(fzf -q ${2:-''})
	$1 $file
}

alias grep="grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}"
alias -g G='| grep -A 2 -B 2'
alias -g G0='| grep'



# frequently used directories

alias -g downloads='~/Downloads/'
alias -g dl=downloads
alias -g web='~/web/'
alias -g playground='~/playground/'
alias -g home='~'



# Git

alias git='hub'
alias g='git'

# the sub command aliases are defined in ~/.gitconfig



# HomeBrew

alias brewls='brew list'



# http-server

alias serve='http-server'



# REPLs

alias js='node'
alias cs='coffee'
alias rb='irb'
alias py='python'



# miscellaneous

alias npmls='npm ls --depth 0'

# tell sub bash shells to use the `~/.bash_profile`
alias bash='bash -l'
# Pretty print the path
# todo: move to ~/bin?
alias path='echo $PATH | tr -s ":" "\n"'

# the amazing localtunnel
alias tunnel='lt -o --port'
