# dotfiles

> This repo is intended to store my configurations for things such as tmux and neovim

## preview

![image](.images/neovim.png)

## Installation

To install the configurations please run the following commands:

```shell
make brew
make git
make install
make dotfiles
```

> The make commands will do the following:
>
> -   `make brew` will install homebrew
> -   `make git` will set your git configurations
> -   `make install` will install the necessary packages using homebrew
> -   `make dotfiles` will setup the dotfiles

This is intended to be used on a fresh install of macOS.
You can rerun the `make dotfiles` and `make install` command to update the
configurations and packages.

## Zshrc

To use the custom Aliases file please add the following into you `.zshrc` file:

```shell
# Add to .zshrc
source $HOME/.config/aliases/aliases
```
