#!/bin/zsh
# Configure ZSH auto completion.



# Propose completions on tab.
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1



# todo: add /usr/local/share/zsh/functions ?
fpath+=(/usr/local/lib/node_modules/npm/lib/utils/completion.sh /usr/local/share/zsh/site-functions /usr/local/share/zsh-completions)

# Expand globs.
setopt GLOB_COMPLETE
