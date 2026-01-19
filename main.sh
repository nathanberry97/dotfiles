#!/usr/bin/env bash

updateSystem() {
    echo "Updating system..."
    sudo dnf update -y
}

installPackages() {
    echo "Installing packages..."

    # --- Install HashiCorp repo if needed (for Terraform) ---
    if ! command -v terraform &>/dev/null; then
        echo "Adding HashiCorp repository..."
        sudo dnf install -y dnf-plugins-core
        wget -O- https://rpm.releases.hashicorp.com/fedora/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo
    else
        echo "Terraform is already installed."
    fi

    # --- Install Terragrunt ---
    echo "Installing Terragrunt..."
    if ! command -v terragrunt &>/dev/null; then
        TERRAGRUNT_VERSION=$(curl -s https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
        echo "Latest Terragrunt version: $TERRAGRUNT_VERSION"

        wget -O terragrunt "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64"
        chmod +x terragrunt
        sudo mv terragrunt /usr/local/bin/

        echo "Terragrunt installed successfully."
    else
        echo "Terragrunt is already installed."
    fi

    # --- Install packages ---
    packageList=(
        alacritty
        fastfetch
        feh
        flatpak
        fzf
        git
        golang
        google-noto-sans-symbols-fonts
        i3
        jetbrains-mono-fonts
        libX11-devel
        libXext-devel
        libXrandr-devel
        libwebp-tools
        lua
        make
        neovim
        nmtui
        nodejs
        pandoc
        picom
        pipx
        podman
        polybar
        ripgrep
        rofi
        solaar
        sqlite
        terraform
        tmux
        unzip
        webkit2gtk3
        xorg-x11-server-Xorg
        xrandr
        zip
    )

    for package in "${packageList[@]}"; do
        if ! rpm -q "$package" &>/dev/null; then
            echo "Installing $package..."
            sudo dnf install -y "$package"
        else
            echo "$package is already installed."
        fi
    done

    # --- Install starship ---
    if command -v starship &>/dev/null; then
        echo "Starship is already installed."
    else
        echo "Installing starship..."
        curl -sS https://starship.rs/install.sh | sh
    fi

    # --- Install AWS CLI ---
    echo "Installing AWS CLI..."
    if ! command -v aws &>/dev/null; then
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        rm awscliv2.zip
        rm -rf aws
    else
        echo "AWS CLI is already installed."
    fi

    # --- Install pre-commit ---
    echo "Installing pre-commit..."
    if ! command -v pre-commit &>/dev/null; then
        pipx install pre-commit
    else
        echo "pre-commit is already installed."
    fi
}

installNpmPackages() {
    echo "Installing npm packages..."
    npmPackages=(
        sass
        @github/copilot
    )

    for package in "${npmPackages[@]}"; do
        if ! npm list -g --depth=0 | grep -q "$package"; then
            echo "Installing $package..."
            sudo npm install -g "$package"
        else
            echo "$package is already installed."
        fi
    done
}

installFlatpakApps() {
    echo "Installing Flatpak apps..."

    if ! flatpak remotes | grep -q flathub; then
        echo "Adding Flathub remote..."
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    flatpakApps=(
        com.google.Chrome
        com.spotify.Client
        com.valvesoftware.Steam
    )

    for app in "${flatpakApps[@]}"; do
        if ! flatpak list | grep -q "$app"; then
            echo "Installing $app..."
            flatpak install -y flathub "$app"
        else
            echo "$app is already installed."
        fi
    done
}

setDotfiles() {
    echo "Setting up dotfiles..."

    # --- Add aliases to bashrc ---
    if ! grep -Fq '. ~/.config/aliases/aliases' ~/.bashrc; then
        {
            echo '# --- Add aliases to bashrc ---'
            echo 'if [ -f ~/.config/aliases/aliases ]; then'
            echo '    . ~/.config/aliases/aliases'
            echo 'fi'
        } >> ~/.bashrc
        echo "Added aliases block to ~/.bashrc"
    else
        echo "Aliases block already exists in ~/.bashrc"
    fi

    # --- Create required directories ---
    mkdir -p ~/.config/{aliases,alacritty,nvim,tmux,i3,picom,polybar,rofi}

    # --- List of dotfiles to purge ---
    dotfilesToRemove=(
        ~/.config/alacritty/alacritty.toml
        ~/.config/aliases/index
        ~/.config/i3/*
        ~/.config/nvim/init.vim
        ~/.config/nvim/lua
        ~/.config/picom/picom.conf
        ~/.config/polybar/*
        ~/.config/rofi/*
        ~/.config/rofi/utils/*
        ~/.config/starship.toml
        ~/.config/tmux/tmux.conf
    )

    echo "Purging existing dotfiles..."
    for file in "${dotfilesToRemove[@]}"; do
        rm -rf "$file"
    done

    # --- Copy new dotfiles ---
    echo "Copying new dotfiles..."
    cp -r ./config/i3/ ~/.config/
    cp -r ./config/nvim/ ~/.config/
    cp -r ./config/polybar/ ~/.config/
    cp -r ./config/rofi/ ~/.config/
    cp ./config/picom/picom.conf ~/.config/picom/picom.conf
    cp ./config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
    cp ./config/aliases/index ~/.config/aliases/index
    cp ./config/starship/starship.toml ~/.config/starship.toml
    cp ./config/tmux/tmux.conf ~/.config/tmux/tmux.conf

    echo "Dotfiles setup complete."
}

# TODO rewire this function
setScripts() {
    echo "Setting up scripts..."

    # --- Create required directories ---
    mkdir -p ~/.local/bin

    # --- List of scripts to purge ---
    scriptsToRemove=(
        ~/.local/bin/tmux-sessioniser
    )

    echo "Purging existing scripts..."
    for script in "${scriptsToRemove[@]}"; do
        rm -rf "$script"
    done

    # --- Copy new scripts ---
    echo "Copying new scripts..."
    cp -r ./config/tmux/tmux-sessioniser ~/.local/bin/tmux-sessioniser
}

configureGit() {
    echo "Configuring git..."

    if git config --global user.name &>/dev/null && git config --global user.email &>/dev/null; then
        echo "Git is already configured."
        return
    else
        read -p "Enter your git email: " email
        read -p "Enter your git name: " username
        git config --global user.name "$username"
        git config --global user.email "$email"
        git config --global core.editor "nvim"
    fi
}

installPlaydateSdk() {
    echo "Installing Playdate SDK..."

    SDK_PATH="$HOME/Developer/PlaydateSDK"
    SHELL_CONFIG="$HOME/.bashrc"

    # Remove existing SDK if it exists
    if [ -d "$SDK_PATH" ]; then
        echo "Existing Playdate SDK found at $SDK_PATH, removing..."
        rm -rf "$SDK_PATH"
    fi

    # Download and extract
    curl -L -o PlaydateSDK-latest.tar.gz https://download.panic.com/playdate_sdk/Linux/PlaydateSDK-latest.tar.gz
    mkdir -p playdate-sdk
    tar -xzf PlaydateSDK-latest.tar.gz --strip-components=1 -C playdate-sdk

    # Move to final destination
    mkdir -p "$(dirname "$SDK_PATH")"
    mv playdate-sdk "$SDK_PATH"

    # Set environment variables in shell config if not already present
    if ! grep -q "export PLAYDATE_SDK_PATH=" "$SHELL_CONFIG"; then
        echo "export PLAYDATE_SDK_PATH=\"$SDK_PATH\"" >> "$SHELL_CONFIG"
        echo "Added PLAYDATE_SDK_PATH to $SHELL_CONFIG"
    else
        echo "PLAYDATE_SDK_PATH already set in $SHELL_CONFIG"
    fi

    if ! grep -q "\$PLAYDATE_SDK_PATH/bin" "$SHELL_CONFIG"; then
        echo 'export PATH="$PATH:$PLAYDATE_SDK_PATH/bin"' >> "$SHELL_CONFIG"
        echo "Added Playdate SDK bin directory to PATH in $SHELL_CONFIG"
    else
        echo "PATH already includes Playdate SDK bin directory"
    fi

    # Clean up
    rm PlaydateSDK-latest.tar.gz

    # Setup playdate sdk
    sudo bash "$SDK_PATH/setup.sh"

    echo "Playdate SDK installed at $SDK_PATH"
}

# --- Main Script Execution ---
clear
cat << "EOF"
=============================
 Fedora System Crafting Tool
=============================
EOF

# --- Ask for sudo privileges at the start ---
echo "Requesting sudo privileges..."
sudo -v

set -e
echo "Starting installation..."

updateSystem
installPackages
installFlatpakApps
installNpmPackages
setDotfiles
setScripts
configureGit
installPlaydateSdk

echo "Setup complete! Please reboot to apply all settings."
