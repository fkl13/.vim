# .vim

My Neovim dot files.

## Requirements

Requires Neovim >= 0.10 for most of the plugins to work.

- [lua-language-server](https://github.com/LuaLS/lua-language-server)
- [StyLua](https://github.com/JohnnyMorganz/StyLua)

## Installation

To set up the vim dotfiles just the following commands.

```console
$ cd ~
$ git clone https://github.com/fkl13/.vim.git .vim
$ cd $HOME/.vim
$ make install
```

### Makefile

You can use the [`Makefile`](Makefile) to run the following commands.

```console
$ make help
install                        Sets up symlinks for vim and neovim
```
