# dotfiles

> This repo is intended to store my configurations for things such as tmux and neovim.

## preview

![image](.images/neovim.png)

![image](.images/terminal.png)

## Plugin manager for neovim

- [neovim plugin manager](https://github.com/wbthomason/packer.nvim)

### Software to install allow code searching feature within neovim

[Install ag to allow code searching within neovim with fzf.vim package](https://github.com/ggreer/the_silver_searcher)

```shell
dnf install the_silver_searcher
apt-get install silversearcher-ag
```

> To see the key mapping I have set for this please look into the
> `./nvim/lua/keymappings.lua` file

### Commands for neovim coc-settings lsp

This section is an overview how to download the LSPs for the following:

- terraform language server
- dockerfile language server

First you'll need to install the [Hashicorp packages](https://www.hashicorp.com/official-packaging-guide),
now you can install the language server with the following command:

```shell
sudo dnf install terraform-ls
```

For the docker language server you need to run the following command:

```shell
sudo npm install -g dockerfile-language-server-nodejs
```

## Starship prompt

Please ensure to add the following into your rc file once you install
[starship](https://starship.rs/guide/#%F0%9F%9A%80-installation):

```shell
# command prompt
eval "$(starship init bash)"
```

## Bash aliases

Here are some useful bash aliases I use:

```shell
# aliases
alias vim="nvim"
alias py="python3"
alias gh="history | grep"
alias ls="ls -l"
alias ..="cd .."
alias ...="cd ../.."

alias gb="git checkout -b"
alias gc="git checkout"
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gl="git log"
alias gs="git status"
alias gd="git diff"

alias notes="cd /home/nathan/vimwiki/"
alias repos="cd /home/nathan/Documents/repos/"
```
