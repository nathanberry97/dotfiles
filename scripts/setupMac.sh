#!/bin/bash

installHomebrew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

installPackages(){
    packageList=(
        ghostty
        neovim
        rectangle
        ripgrep
        starship
        tmux
    )

    for package in "${packageList[@]}"; do
        brew install $package
    done

    brew cleanup
}

purgeOldDotfiles(){
    rm -rf ~/.config/aliases/aliases
    rm -rf ~/.config/ghostty/config
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.config/nvim/lua
    rm -rf ~/.config/starship.toml
    rm -rf ~/.config/tmux/tmux.conf
    rm -rf ~/.local/bin/tmux-sessioniser
}

createDirs(){
    mkdir -p ~/.config/aliases
    mkdir -p ~/.config/ghostty
    mkdir -p ~/.config/nvim
    mkdir -p ~/.config/tmux
    mkdir -p ~/.local/bin
}

setDotfiles(){
    cp -r ./nvim/ ~/.config/nvim/
    cp ./aliases/zsh ~/.config/aliases/aliases
    cp ./ghostty/config ~/.config/ghostty/config
    cp ./starship/starship.toml ~/.config/starship.toml
    cp ./tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
}

while getopts "b?i?d?" opt; do
    case $opt in
        b)
            installHomebrew
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
