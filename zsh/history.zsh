#!/bin/zsh
# Configure the ZSH history.



if [ -z "$HISTFILE" ]; then
    HISTFILE=~/.config/zsh/history
fi

HISTSIZE=10000
SAVEHIST=10000

# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt hist_ignore_dups

# New history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt inc_append_history

# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file.
setopt share_history
