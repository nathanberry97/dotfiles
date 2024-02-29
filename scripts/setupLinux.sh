#!/bin/bash

installPackages(){
    packageList=(
        alacritty
        feh
        i3
        neovim
        picom
        ripgrep
        rofi
        slock
        starship
        tmux
        xautolock
    )

    sudo dnf update -y

    for package in "${packageList[@]}"; do
        sudo dnf install $package -y
    done

    sudo dnf clean all
}

purgeOldDotfiles(){
    rm -rf ~/.config/alacritty/alacritty.toml
    rm -rf ~/.config/aliases/aliases
    rm -rf ~/.config/i3/background.png
    rm -rf ~/.config/i3/config
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.config/nvim/lua
    rm -rf ~/.config/picom/picom.conf
    rm -rf ~/.config/rofi/config.rasi
    rm -rf ~/.config/starship.toml
    rm -rf ~/.config/tmux/tmux.conf
    rm -rf ~/.local/bin/rofi-blu
    rm -rf ~/.local/bin/tmux-sessioniser
}

createDirs(){
    mkdir -p ~/.config
    mkdir -p ~/.config/alacritty
    mkdir -p ~/.config/aliases
    mkdir -p ~/.config/i3
    mkdir -p ~/.config/nvim
    mkdir -p ~/.config/picom
    mkdir -p ~/.config/rofi
    mkdir -p ~/.config/tmux
    mkdir -p ~/.local/bin
}

setDotfiles(){
    chmod +x ./rofi/rofi-blu
    chmod +x ./tmux/tmux-sessioniser

    cp -r ./nvim/ ~/.config/
    cp ./alacritty/linux.toml ~/.config/alacritty/alacritty.toml
    cp ./aliases/bash ~/.config/aliases/aliases
    cp ./i3/background.png ~/.config/i3/background.png
    cp ./i3/config ~/.config/i3/config
    cp ./picom/picom.conf ~/.config/picom/picom.conf
    cp ./rofi/config.rasi ~/.config/rofi/config.rasi
    cp ./rofi/rofi-blu ~/.local/bin/rofi-blu
    cp ./starship/starship.toml ~/.config/starship.toml
    cp ./tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
}

while getopts "i?d?" opt; do
    case $opt in
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
