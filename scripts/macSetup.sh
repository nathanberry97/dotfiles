#!/usr/bin/env bash

set -e
set -u

# =========[ Colours & logging ]=========
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

# =========[ Install Brew Packages ]=========
installPackages() {
    log "Installing brew packages..."

    brew tap hashicorp/tap
    brew tap alphagov/gds

    packageList=(
        alphagov/gds/gds-cli
        aws-vault
        detect-secrets
        gemini
        ghostty
        go
        hashicorp/tap/terraform
        neovim
        node
        pre-commit
        pyenv
        rectangle
        ripgrep
        semgrep
        starship
        terragrunt
        tmux
    )

    for package in "${packageList[@]}"; do
        if brew list "$package" &>/dev/null; then
            log "$package is already installed."
        else
            brew install "$package" || warn "Failed: $package"
        fi
    done

    brew cleanup

    log "brew packages done."

    # Global npm tools
    if npm list -g --depth=0 | grep -q "nx"; then
        warn "nx already installed."
    else
        npm add --global nx
        log "nx installed."
    fi

    if npm list -g --depth=0 | grep -q "pnpm"; then
        warn "pnpm already installed."
    else
        npm add --global pnpm
        log "pnpm installed."
    fi
}

# =========[ Install NVM ]=========
installNvm() {
    log "Installing NVM..."
    if [ -d "$HOME/.nvm" ]; then
        warn "NVM already installed, skipping."
    else
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        log "NVM installed."
    fi
}

# =========[ Install AWS CLI ]=========
installAwsCli() {
    log "Installing AWS CLI..."
    if command -v aws &>/dev/null; then
        warn "AWS CLI already installed, skipping."
    else
        curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
        sudo installer -pkg ./AWSCLIV2.pkg -target /
        rm "AWSCLIV2.pkg"
        log "AWS CLI installed."
    fi
}

# =========[ Create Dotfile Directories ]=========
createDirs() {
    log "Creating dotfile dirs..."
    mkdir -p ~/.config/{aliases,ghostty,nvim,tmux}
    mkdir -p ~/.local/bin
}

# =========[ Purge Old Dotfiles ]=========
purgeOldDotfiles() {
    log "Purging old dotfiles..."
    dotfilesToRemove=(
        ~/.config/aliases/index
        ~/.config/ghostty/config
        ~/.config/nvim/init.vim
        ~/.config/nvim/lua
        ~/.config/starship.toml
        ~/.config/tmux/tmux.conf
        ~/.local/bin/tmux-sessioniser
    )

    for file in "${dotfilesToRemove[@]}"; do
        rm -rf "$file"
    done
}

# =========[ Copy Dotfiles ]=========
setDotfiles() {
    log "Copying new dotfiles..."
    cp -r ./config/nvim/ ~/.config/nvim/
    cp ./config/aliases/index ~/.config/aliases/index
    cp ./config/ghostty/config ~/.config/ghostty/config
    cp ./config/starship/starship.toml ~/.config/starship.toml
    cp ./config/tmux/tmux.conf ~/.config/tmux/tmux.conf
    log "Dotfiles set successfully."
}

# =========[ Copy Scripts ]=========
setScripts() {
    log "Copying scripts..."
    cp ./config/tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
    chmod +x ~/.local/bin/tmux-sessioniser
}

# =========[ Configure Git ]=========
configureGit() {
    log "Configuring Git..."
    if git config --global user.name &>/dev/null && git config --global user.email &>/dev/null; then
        warn "Git already configured, skipping."
    else
        read -rp "Enter your git email: " email
        read -rp "Enter your git name: " username
        git config --global user.name "$username"
        git config --global user.email "$email"
        git config --global core.editor "nvim"
        git config --global commit.gpgsign true
        git config --global gpg.format ssh
        log "Git configured."
    fi
}

# =========[ Main Execution ]=========

clear
cat << "EOF"
=============================
     macOS Crafting Tool
=============================
EOF

echo "Requesting sudo privileges..."
sudo -v

log "Starting setup..."

installHomebrew
installPackages
installNvm
installAwsCli
createDirs
purgeOldDotfiles
setDotfiles
setScripts
configureGit

log "Setup complete!"
