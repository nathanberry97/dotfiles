# dotfiles

> This repo is intended to store my configurations for things such as tmux and
> neovim

## preview

![image](.images/neovim.png)

## Installation

To install the configurations please run the following commands with `make`:

```shell
dotfiles

Usage:
  git                Setup git
  brew               [macOS] Install brew
  install            [macOS] Install dependencies
  dotfiles           [macOS] Set dotfiles
```

## Zshrc

To use the custom Aliases file please add the following into you `.zshrc` file:

```shell
# Add to .zshrc
source $HOME/.config/aliases/aliases
```
