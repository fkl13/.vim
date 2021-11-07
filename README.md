# .vim

My vim dot files.

## Requirements

Requires Neovim >= 0.5 for most of the plugins to work. And uses
[vim-plug](https://github.com/junegunn/vim-plug) as plugin manager.

## Installation

To set up the vim dotfiles just the following commands.

```console
$ cd ~
$ git clone https://github.com/fkl13/.vim.git .vim
$ cd $HOME/.vim
$ make install
$ make install-plugins
```

### Makefile

You can use the [`Makefile`](Makefile) to run the following commands.

```console
$ make help
clean-plugins                  Remove unlisted plugins
install-plugins                Install all plugins
install                        Sets up symlinks for vim and neovim
update-plugins                 Updates all plugins
upgrade-vim-plug               Upgrade vim-plug
```
