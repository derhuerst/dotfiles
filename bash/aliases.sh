#!/bin/bash



# better `ls -a`
alias ls='ls -AFGp'
alias lsl='ls -AFGhlop'

alias ..='cd ..'
alias ...='cd ../..'

# `o file.txt`: open file in default app
# `o http://example.com`: open URL in default browser
# `o` open pwd in Finder
function o {
	open ${@:-'.'}
}

# shorthand for `chmod +x file`
function +x {
	chmod +x "$@"
}

# shorthand for `http-server [options]`
function serve {
	http-server "$@"
}

# shorthands for git
alias gs='git status'
alias ga='git add'

# directories
alias md='cd /Volumes/Medien'
alias dl='cd ~/Downloads/'
alias wb='cd ~/Web/'
alias ~='cd ~'
alias home='cd ~'