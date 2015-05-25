#!/bin/bash



# Display the exit code of last command in red, if non-zero.
ps1PrintExitCode () {
	ps1ExitCode=$?
	if [ $ps1ExitCode -ne 0 ]; then
		printf $textBold$textRed
		printf '!! '$ps1ExitCode' '$textNormal
	fi
}



# Display the last 3 items of the working directory.
ps1PrintPath () {
	ps1Result=''
	ps1PWD=$PWD
	for ps1Color in "${textBlue[@]}"; do
		if [ $ps1PWD == "/" ]; then # we're at the root
			ps1Result=$ps1Color'/'$ps1Result # add colord `/`
			break
		fi
		ps1Result=$ps1Color$(basename $ps1PWD)'/'$ps1Result
		ps1PWD=$(dirname $ps1PWD) # move one dir up
	done

	printf '\n'${ps1Result%?}' ' # todo: remove traling `/`
}



# Display the prompt symbol.
ps1PrintPrompt () {
	printf $textYellow'♦ '$textNormal
}



PS1='$(ps1PrintExitCode)$(ps1PrintPath)$(ps1PrintPrompt)'