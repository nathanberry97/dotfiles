#!/bin/bash

setupGit(){
    read -p "Enter your git email: " email
    read -p "Enter your git name: " username
    git config --global user.name $username
    git config --global user.email $email
    git config --global core.editor "nvim"
}

while getopts "g?" opt; do
    case $opt in
        g)
            setupGit
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
