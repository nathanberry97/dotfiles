#!/bin/bash

installPackages(){
    packageList=(
        alacritty
        golang
        i3
        jq
        luarocks
        neovim
        nodejs
        pandoc
        podman
        ripgrep
        starship
        terraform
        tmux
    )

    sudo dnf update -y

    for package in "${packageList[@]}"; do
        sudo dnf install $package -y
    done

    sudo dnf clean all
}

installPackagesPython(){
    pythonPackages=(
        pre-commit
        cfn-lint
        checkov
    )

    for package in "${pythonPackages[@]}"; do
        pip install $package
    done
}

purgeOldDotfiles(){
    rm -rf ~/.config/alacritty/alacritty.toml
    rm -rf ~/.config/aliases/aliases
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.config/nvim/lua
    rm -rf ~/.config/starship.toml
    rm -rf ~/.config/tmux/tmux.conf
    rm -rf ~/.local/bin/tmux-sessioniser
}

createDirs(){
    mkdir -p ~/.config
    mkdir -p ~/.config/alacritty
    mkdir -p ~/.config/aliases
    mkdir -p ~/.config/nvim
    mkdir -p ~/.config/tmux
    mkdir -p ~/.local/bin
}

setDotfiles(){
    cp -r ./nvim/ ~/.config/
    cp ./alacritty/linux.toml ~/.config/alacritty/alacritty.toml
    cp ./aliases/bash ~/.config/aliases/aliases
    cp ./starship/starship.toml ~/.config/starship.toml
    cp ./tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
}

while getopts "i?d?" opt; do
    case $opt in
        i)
            installPackages
            installPackagesPython
            ;;
        d)
            createDirs
            purgeOldDotfiles
            setDotfiles
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
