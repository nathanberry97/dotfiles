# dotfiles - works

> This repo is intended to store my configurations for things such as tmux and
> neovim

## Setting up macbook

To install packages needed for my work setup for MacOS run the following
command:

```
./scripts/macSetup.sh
```

### Zshrc

To use the custom Aliases file please add the following into you `.zshrc` file:

```shell
# Add to .zshrc
source $HOME/.config/aliases/aliases
```

## i3wm like keybindings

On a MacOS you can setup keybindings which are quite similar to i3, to do this
head into the settings and follow the following:

```shell
keyboard -> keyboard shortcuts... -> mission control -> mission control drop down -> set up switch to Desktop x
```

> NOTE:
> I quite like making this match to super 1 for Desktop 1 and so on

Secondly I also I like to reduce motion as it makes switching workspaces easier
on the eye, to do this follow the following:

```shell
accessibility -> display -> reduce motion
```
