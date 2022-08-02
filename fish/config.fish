# Disable the Pager
set -x PAGER    cat
set -x MANPAGER cat


# Default Editor
set -g EDITOR 'st --wait'


# Path
#set fish_user_paths ./node_modules/.bin $HOME/bin $HOME/.local/bin $fish_user_paths

#set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
#set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -p -x PATH "$HOME/go/bin:$HOME/.cargo/bin"


# File Handling
function ls;     command ls -AFGpa $argv;                end
function lsa;    command ls -AFGhlop $argv;              end
function ...;    command cd ../..;                          end
function ....;   command cd ../../..;                       end
function mkcd;   command mkdir -p $argv[1]; cd $argv[1]; end

function o
	if [ -n $argv[2] ]; command open -a $argv[2] $argv[1]
	else;               command open $argv[1];           end
end

function tree
	command tree -aFC -L 4 -I 'node_modules|.git' --dirsfirst --sort=name $argv
end
function ftree # flat tree
	command tree -afFiC -L 4 -I 'node_modules|.git' --dirsfirst --sort=name $argv
end


# Search
function spl;    command mdfind -onlyin . $argv;         end
function spot;   command rg $argv;                       end
function G0;     command grep $argv;                     end
function Gv;     command grep -v $argv;                  end

function fuz;    command fzf | command xargs st {};      end


# Directories
function downloads;  builtin echo "$HOME/Downloads";     end
function playground; builtin echo "$HOME/playground";    end


# Programming
function js;     command node $argv;                     end
function npmls;  command npm ls --depth 0;               end

## csv
function csv-search; command xsv search $argv; end
function csv-select; command xsv select $argv; end
function csv-sort; command xsv sort $argv; end

# Miscellaneous
function each; command gxargs -L1 -I% -- $argv;              end

function diff; command git diff --no-index $argv; end

# https://github.com/localtunnel/localtunnel#readme
function tunnel; command lt -o $argv;                    end

function dns;    command dig +short $argv;               end

function iso8601
	command gdate --iso-8601=seconds
end

function jq-ignore-invalid;
	command jq -R 'fromjson? | select(type == "object")' $argv
end

function ssh-tunnel
	command ssh -nNT -L $argv[2]':localhost:'$argv[2] $argv[1]
end

eval (starship init fish)
set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths
fish_add_path /usr/local/opt/curl/bin
