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

# Install packages from Brewfile
if [ -f "$SCRIPT_DIR/Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file="$SCRIPT_DIR/Brewfile"
    echo "Packages installed"
fi

echo "Homebrew setup complete"