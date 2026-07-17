#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📦 Setting up Homebrew..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add to PATH for Apple Silicon
    if [[ $(uname -m) == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo "Homebrew installed"
else
    echo "Homebrew already installed"
fi

is_app_installed() {
    local cask=$1

    case "$cask" in
        docker-desktop)
            [ -d "/Applications/Docker.app" ]
            ;;
        google-chrome)
            [ -d "/Applications/Google Chrome.app" ]
            ;;
        iterm2)
            [ -d "/Applications/iTerm.app" ] || [ -d "/Applications/iTerm2.app" ]
            ;;
        postman)
            [ -d "/Applications/Postman.app" ]
            ;;
        visual-studio-code)
            [ -d "/Applications/Visual Studio Code.app" ]
            ;;
        *)
            return 1
            ;;
    esac
}

install_tap_if_missing() {
    local tap=$1

    if brew tap | grep -Fxq "$tap"; then
        echo "Tap already configured: $tap"
    else
        echo "Adding tap: $tap"
        HOMEBREW_NO_AUTO_UPDATE=1 brew tap "$tap"
    fi
}

install_formula_if_missing() {
    local formula=$1

    if brew list --formula "$formula" &> /dev/null; then
        echo "Formula already installed, skipping: $formula"
    else
        echo "Installing formula: $formula"
        HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1 brew install "$formula"
    fi
}

install_cask_if_missing() {
    local cask=$1

    if brew list --cask "$cask" &> /dev/null || is_app_installed "$cask"; then
        echo "Cask/app already installed, skipping: $cask"
    else
        echo "Installing cask: $cask"
        HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1 brew install --cask "$cask"
    fi
}

# Install only missing entries from Brewfile. Do not update or reinstall existing apps.
if [ -f "$SCRIPT_DIR/Brewfile" ]; then
    echo "Installing missing packages from Brewfile..."
    while IFS= read -r line; do
        if [[ $line =~ ^[[:space:]]*tap[[:space:]]+\"([^\"]+)\" ]]; then
            install_tap_if_missing "${BASH_REMATCH[1]}"
        elif [[ $line =~ ^[[:space:]]*brew[[:space:]]+\"([^\"]+)\" ]]; then
            install_formula_if_missing "${BASH_REMATCH[1]}"
        elif [[ $line =~ ^[[:space:]]*cask[[:space:]]+\"([^\"]+)\" ]]; then
            install_cask_if_missing "${BASH_REMATCH[1]}"
        fi
    done < "$SCRIPT_DIR/Brewfile"
    echo "Missing packages installed"
fi

echo "Homebrew setup complete"
