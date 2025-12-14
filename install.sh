#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles modules..."
echo "Working directory: $DOTFILES_DIR"
echo ""

# Function to run module installer
install_module() {
    local module=$1
    local install_script="$DOTFILES_DIR/$module/install.sh"
    
    if [ -f "$install_script" ]; then
        echo "Installing module: $module"
        bash "$install_script"
        echo "$module installed"
        echo ""
    else
        echo "No installer found for: $module"
        echo ""
    fi
}

# Install modules in order
echo "=== Core Modules ==="
install_module "homebrew"
install_module "zsh"

echo "=== Language Modules ==="
install_module "lang/java"
install_module "lang/python"
install_module "lang/node"

echo "=== Tool Modules ==="
install_module "tools/docker"
install_module "tools/kubectl"
install_module "tools/terraform"

echo ""
echo "All modules installed!"
echo "Please restart your terminal or run: source ~/.zshrc"