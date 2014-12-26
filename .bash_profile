#!/bin/bash



# Load user binaries
export PATH=~/Downloads/jdk-8u25/bin:~/bin:$PATH



# Load config scripts
source ~/.config/aliases.sh
source ~/.config/completion.sh



myDefault="\[\033[0m\]"
myRed="\[\033[31m\]"
myBlue="\[\033[38;5;67m\]"
myYellow="\[\033[38;5;220m\]"
myGray="\[\033[90m\]"



# Display user and machine in gray, if connected via SSH.
if [ "$SSH_CONNECTION" ]; then
	printf "${myGray}Connected to ${myBlue}${HOSTNAME}${myGray} as ${myBlue}${USER}${myGray}.\n${myDefault}"
fi



PS1=""

# Add a blank line.
PS1='\n'$PS1

# Display the exit code of last command in red, if non-zero.
PS1+='$(myStatus=$?;if [ $myStatus = "0" ]; then echo ""; else echo "'
PS1+=$myRed'!! $myStatus'$myGray' | '
PS1+='";fi)'

# Display the working directory in yellow.
PS1+=$myBlue'$(echo \W) '

# Display the prompt symbol delimiter in gray.
PS1+=$myYellow'⚡ '

# Switch to default color.
PS1+=$myDefault