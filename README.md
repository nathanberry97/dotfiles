# dotfiles

> This repo is intended to store my configurations for things such as tmux and neovim.

## preview

![image](.images/neovim.png)

![image](.images/terminal.png)

## Software to install allow code searching feature within neovim

[Install the\_silver\_searcher to allow code searching within neovim with fzf.vim package](https://github.com/ggreer/the_silver_searcher)

```shell
dnf install the_silver_searcher
apt-get install silversearcher-ag
```

> To see the key mapping I have set for this please look into the
> `./nvim/lua/keymappings.lua` file

## Starship prompt

Please ensure to add the following into your rc file once you install
[starship](https://starship.rs/guide/#%F0%9F%9A%80-installation):

To use the prompt line make sure you include the following section as this
has the command to add the prompt to your command line.

## Aliases

To use the custom Aliases file please add the following into you `.bashrc` file:

```shell
# Add custom aliases into bash config
if [ -f ~/.config/aliases/aliases ]; then
    . ~/.config/aliases/aliases
fi
```

If you are using zsh please add the following into you `.zshrc` file:

```shell
source $HOME/.config/aliases/aliases
```
