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
    brew tap hashicorp/tap

    local packageList=(
        alphagov/gds/gds-cli
        aws-vault
        ghostty
        hashicorp/tap/terraform
        neovim
        node
        pre-commit
        pyenv
        rectangle
        ripgrep
        starship
        terragrunt
        tmux
    )

    log "Installing packages via Homebrew..."
    for package in "${packageList[@]}"; do
        brew install "$package" || warn "Package $package failed or already installed."
    done
    brew cleanup

    # Install nx monorepo & pnpm
    npm add --global nx
    npm add --global pnpm

    log "Package installation complete."

    # NVM install
    # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    # AWS CLI install
    # curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    # sudo installer -pkg ./AWSCLIV2.pkg -target /

    # yubikey-manager install
    # pip3 install --user yubikey-manager
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
    cp -r ./config/nvim/ ~/.config/nvim/
    cp ./config/aliases/zsh ~/.config/aliases/aliases
    cp ./config/ghostty/config ~/.config/ghostty/config
    cp ./config/starship/starship.toml ~/.config/starship.toml
    cp ./config/tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    cp ./config/tmux/tmux.conf ~/.config/tmux/tmux.conf
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
    exit 1
}

# =========[ Parse Options ]=========
if [ $# -eq 0 ]; then usage; fi

while getopts "bidg" opt; do
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
        *)
            usage
            ;;
    esac
done

log "Setup complete"
