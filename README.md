# dotfiles

This repo is intended to store my configurations for things such as tmux
and neovim.

## preview

![image](images/setup.png)

## Plugin manager for vim and neovim

- [neovim plugin manager](https://github.com/wbthomason/packer.nvim)
- [vim plugin manager](https://github.com/junegunn/vim-plug)

> **note** I currently use neovim and the vim setup won't be maintained

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
