#!/bin/zsh
# Set up all the rest.



export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="Gxfxcxdxbxegedabagacad"

setopt auto_cd

# Disable the system pager.
export MANPAGER='cat'
export PAGER='cat'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='slap'
else
  export EDITOR='st'
fi



# Hacker-friendly key-bindings.

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
