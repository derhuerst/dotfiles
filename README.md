# dotfiles

**Dotfiles help you personalize your system.** Mine, **made for OS X** and [MIT-licensed](LICENSE), include the following.

- global [`.editorconfig`](http://editorconfig.org/)
- [`.gitconfig`](http://git-scm.com/docs/git-config#EXAMPLES) and [`.gitignore`](http://git-scm.com/docs/gitignore#_examples)
- [`.npmrc`](https://docs.npmjs.com/files/npmrc)
- global [slap config](https://github.com/slap-editor/slap/blob/master/slap.ini)
- [`.zshrc`](https://wiki.archlinux.org/index.php/Zsh#Simple_.zshrc)



## Install

Note: You need an [Unix-like operating system](http://en.wikipedia.org/wiki/Unix-like) to install this thing.

### The easy way, using [osx-setup](https://github.com/derhuerst/osx-setup)

[Install my osx-setup](https://github.com/derhuerst/osx-setup/blob/master/README.md#install) repo, which [installs useful developer stuff](https://github.com/derhuerst/osx-setup/blob/master/README.md#osx-setup--os-x-on-steroids) including everything these dotfiles support. Then run the following code.

```shell
curl -sSL https://raw.githubusercontent.com/derhuerst/dotfiles/master/install | bash
```


### The manual way

The bare minimum required to install these dotfiles is [Bash](http://de.wikipedia.org/wiki/Bash_%28Shell%29) and [Git](http://git-scm.com/). Bash is already bundled with almost all operating systems. Read more about [how to install Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03).

If you have an existing `~/.config` directory, back it up.

```shell
mv ~/.config ~/.config.backup
```

Then, clone this repository using Git.

```shell
git clone https://github.com/derhuerst/dotfiles.git ~/.config
```

Now, you can symlink the configuration files you need.

```shell
ln -s ~/.config/editorconfig/editorconfig ~/.editorconfig
ln -s ~/.config/git/gitignore ~/.gitignore
ln -s ~/.config/git/gitconfig ~/.gitconfig
ln -s ~/.config/homebrew/brew-aliases ~/.brew-aliases
ln -s ~/.config/npm/npmrc ~/.npmrc
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/bash/bash_profile ~/.bash_profile
```

Additionaly, you can create a [`.hushlogin` file](https://kb.iu.edu/d/acdd) by typing `touch ~/.hushlogin`.

You can install the optional stuff these dotfiles support. Run `brew update` first.

software | how to install on OS X
:--------|:-------------------------
[NPM](https://nodejs.org/) | `brew install node`
[ZSH](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e#step-1--install-homebrew) | `brew install zsh`
[slap](https://github.com/slap-editor/slap) | `npm install -g zsh`

If you installed ZSH, rebuild the completion index.

```shell
source ~/.config/zsh/zshrc
rm -f ~/.zcompdump
autoload -Uz compinit
compinit
```



## Contributing

If you **have a question**, **found a bug** or want to **propose a feature**, have a look at [the issues page](https://github.com/derhuerst/dotfiles/issues).
