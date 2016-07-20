set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish


# Disable the Pager
set -x PAGER    cat
set -x MANPAGER cat


# Default Editor
if test $SSH_CONNECTION; set -g EDITOR nano
else;                    set -g EDITOR st;               end


# Path
set fish_user_paths ./node_modules/.bin $HOME/bin $fish_user_paths ^ /dev/null


# File Handling
function ls;     command ls -AFGpa $argv;                end
function lsa;    command ls -AFGhlop $argv;              end
function ...;    command ../..;                          end
function ....;   command ../../..;                       end
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
function spot;   command spot -e node_modules $argv;     end
function G0;     command grep $argv;                     end
function Gv;     command grep -v $argv;                  end

function fuz
	if [ -n $argv[2] ]; $argv[1] (fuz -q $argv[2])
	else; $argv[1] (fuz); end
end


# Directories
function home;       builtin echo $HOME;                 end
function downloads;  builtin echo "$HOME/Downloads";     end
function playground; builtin echo "$HOME/playground";    end

function web
	if [ -n $argv[1] ]; builtin cd $HOME'/web/'$argv[1];
	else;               builtin echo "$HOME/web";        end
end


# Programming
function git;    command hub $argv;                      end
function g;      command hub $argv;                      end
function js;     command node $argv;                     end
function cs;     command coffee $argv;                   end
function cbs;    command coffee -cbs;                    end
function npmls;  command npm ls --depth 0;               end
function np;     command np --skip-cleanup $argv;        end


# Miscellaneous
function serve;  command http-server .;                  end # https://github.com/indexzero/http-server#readme
function tunnel; command lt -o $argv;                    end # https://github.com/localtunnel/localtunnel#readme
function dns;    command dig +short $argv;               end
function c;      command clear;                          end
function ssh-tunnel
	command ssh -nNT -L $argv[2]':localhost:'$argv[2] $argv[1]
end
