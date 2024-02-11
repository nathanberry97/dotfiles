#!/bin/bash

installHomebrew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

setupGit(){
    read -p "Enter your git email: " email
    read -p "Enter your git name: " username
    git config --global user.name $username
    git config --global user.email $email
    git config --global core.editor "nvim"
}

installPackages(){
    packageList=(
        alacritty
        awscli
        cfn-lint
        go
        jq
        lua
        neovim
        nvm
        pandoc
        podman
        pre-commit
        rectangle
        starship
        terraform
        the_silver_searcher
        tmux
        yq
    )

    for package in "${packageList[@]}"; do
        brew install $package
    done

    brew cleanup
}

purgeOldDotfiles(){
    rm -rf ~/.config/alacritty.yml
    rm -rf ~/.config/aliases/aliases
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.config/nvim/lua
    rm -rf ~/.config/starship.toml
    rm -rf ~/.config/tmux/tmux.conf
    rm -rf ~/.local/bin/tmux-sessioniser
}

createDirs(){
    mkdir -p ~/.config/tmux
    mkdir -p ~/.config/nvim
    mkdir -p ~/.config/aliases
    mkdir -p ~/.local/bin
}

setDotfiles(){
    cp ./alacritty/alacritty.yml ~/.config/alacritty.yml
    cp ./starship/starship.toml ~/.config/starship.toml
    cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
    cp -r ./nvim/ ~/.config/nvim/
    cp ./aliases/aliases ~/.config/aliases/aliases
    cp ./tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
}

while getopts "b?g?i?d?" opt; do
    case $opt in
        b)
            installHomebrew
            ;;
        g)
            setupGit
            ;;
        i)
            installPackages
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
