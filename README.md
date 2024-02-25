# dotfiles

> This repo is intended to store my configurations for things such as tmux and neovim

## preview

![image](.images/neovim.png)

## Installation

To install the configurations please run the following commands:

```shell
Usage:
  git                   Setup git
  installLinux          [Linux] Install dependencies
  dotfilesLinux         [Linux] Set dotfiles
  brewMac               [macOS] Install brew
  installMac            [macOS] Install dependencies
  dotfilesMac           [macOS] Set dotfiles
```

## Zshrc

To use the custom Aliases file please add the following into you `.zshrc` file:

```shell
# Add to .zshrc
source $HOME/.config/aliases/aliases
```

## Bashrc

To use the custom Aliases file please add the following into you `.bashrc` file:

```shell
# Add custom aliases into bash config
if [ -f ~/.config/aliases/aliases ]; then
    . ~/.config/aliases/aliases
fi
```

## Slock

If you want to update the slock configurations you will need to clone the repo
here is the command to do so:

```shell
git clone https://git.suckless.org/slock
```

Once install you can update the `config.h` file you can change the colours here:

```shell
static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#303446",   /* during input */
	[FAILED] = "#232634",   /* wrong password */
};
```

Afterwards you will need to compile the slock program and replace the old one:

```shell
sudo make clean install
```

> Note: you need to have `libXrandr-devel` installed to compile slock
