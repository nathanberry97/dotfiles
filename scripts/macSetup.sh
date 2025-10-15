#!/bin/bash

# mac-setup.sh — Personal macOS setup script
# Author: Nathan Berry
# Description: Installs packages, sets up dotfiles, and configures Git.

set -e  # Exit on error
set -u  # Exit on undefined variable

# =========[ Colors for logs ]=========
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

log()   { echo -e "${GREEN}[✔]${RESET} $1"; }
warn()  { echo -e "${YELLOW}[!]${RESET} $1"; }
error() { echo -e "${RED}[✖]${RESET} $1"; }

# =========[ Install Homebrew ]=========
installHomebrew() {
    if ! command -v brew &>/dev/null; then
        warn "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        log "Homebrew installed."
    else
        log "Homebrew already installed."
    fi
}

# =========[ Install Packages ]=========
installPackages() {
    local packageList=(
        ghostty
        neovim
        rectangle
        ripgrep
        starship
        tmux
    )

    log "Installing packages via Homebrew..."
    for package in "${packageList[@]}"; do
        brew install "$package" || warn "Package $package failed or already installed."
    done
    brew cleanup
    log "Package installation complete."
}

# =========[ Purge Old Dotfiles ]=========
purgeOldDotfiles() {
    log "Removing old dotfiles..."
    rm -rf ~/.config/aliases/aliases
    rm -rf ~/.config/ghostty/config
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.config/nvim/lua
    rm -rf ~/.config/starship.toml
    rm -rf ~/.config/tmux/tmux.conf
    rm -rf ~/.local/bin/tmux-sessioniser
}

# =========[ Create Directories ]=========
createDirs() {
    log "Creating configuration directories..."
    mkdir -p ~/.config/{aliases,ghostty,nvim,tmux}
    mkdir -p ~/.local/bin
}

# =========[ Copy Dotfiles ]=========
setDotfiles() {
    log "Copying new dotfiles..."
    cp -r ./nvim/ ~/.config/nvim/
    cp ./aliases/zsh ~/.config/aliases/aliases
    cp ./ghostty/config ~/.config/ghostty/config
    cp ./starship/starship.toml ~/.config/starship.toml
    cp ./tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
    chmod +x ~/.local/bin/tmux-sessioniser
    log "Dotfiles set successfully."
}

# =========[ Git Setup ]=========
setupGit() {
    read -rp "Enter your Git email: " email
    read -rp "Enter your Git username: " username
    git config --global user.name "$username"
    git config --global user.email "$email"
    git config --global core.editor "nvim"
    log "Git configured for $username <$email>."
}

# =========[ Main Execution Options ]=========
usage() {
    echo "Usage: $0 [-b] [-i] [-d] [-g] [-a]"
    echo "  -b   Install Homebrew"
    echo "  -i   Install packages"
    echo "  -d   Set up dotfiles (purge + copy)"
    echo "  -g   Configure Git"
    echo "  -a   Run all setup steps"
    exit 1
}

# =========[ Parse Options ]=========
if [ $# -eq 0 ]; then usage; fi

while getopts "bidga" opt; do
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
        g)
            setupGit
            ;;
        a)
            installHomebrew
            installPackages
            createDirs
            purgeOldDotfiles
            setDotfiles
            setupGit
            ;;
        *)
            usage
            ;;
    esac
done

log "Setup complete"

