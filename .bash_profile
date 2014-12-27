#!/bin/bash



# Load user binaries
export PATH=~/Downloads/jdk-8u25/bin:~/bin:$PATH



# test colors
# weird bash bugs! took hours -.-
# http://superuser.com/a/301355
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
textNormal="\x01\033[0m\x02"
textBold="\x01\033[1m\x02"
textRed="\x01\033[38;5;1m\x02"
textBlue[1]="\x01\033[38;5;69m\x02"
textBlue[2]="\x01\033[38;5;27m\x02"
textBlue[3]="\x01\033[38;5;20m\x02"
textBlue[4]="\x01\033[38;5;18m\x02"
textYellow="\x01\033[38;5;220m\x02"
textGray="\x01\033[90m\x02"



# Load config scripts
source ~/.config/ps1.sh
source ~/.config/aliases.sh
source ~/.config/completion.sh



# Display user and machine in gray, if connected via SSH.
if [ "$SSH_CONNECTION" ]; then
	printf $textGray'Connected to '$textYellow$HOSTNAME$textGray' as '$textYellow$USER$textGray'.\n'$textNormal
fi