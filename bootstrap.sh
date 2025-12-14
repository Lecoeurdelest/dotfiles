#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/Documents/pancake-quy/dotfiles"
DOTFILES_BACKUP_DIR="$HOME/.dotfiles.backup.$(date +%Y%m%d_%H%M%S)"

echo "🚀 Bootstrapping dotfiles..."
echo "📁 Dotfiles directory: $DOTFILES_DIR"

# Backup existing configs
backup_if_exists() {
    local file=$1
    if [ -f "$file" ] || [ -d "$file" ]; then
        echo "Backing up $file"
        mkdir -p "$DOTFILES_BACKUP_DIR"
        cp -r "$file" "$DOTFILES_BACKUP_DIR/"
    fi
}

# Backup existing zshrc
backup_if_exists "$HOME/.zshrc"

# Create symlink to new zshrc
echo "Creating symlink for .zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshrc.zsh" "$HOME/.zshrc"

# Create private directory if not exists
if [ ! -d "$DOTFILES_DIR/private" ]; then
    mkdir -p "$DOTFILES_DIR/private"
    touch "$DOTFILES_DIR/private/env.zsh"
    touch "$DOTFILES_DIR/private/overrides.zsh"
    echo "Created private config directory"
fi

# Add private to .gitignore
if [ ! -f "$DOTFILES_DIR/.gitignore" ]; then
    echo "private/" > "$DOTFILES_DIR/.gitignore"
    echo "Created .gitignore"
fi

echo ""
echo "Bootstrap completed!"
echo "Next steps:"
echo "   1. Run: cd $DOTFILES_DIR"
echo "   2. Run: ./install.sh"
echo "   3. Restart your terminal or run: source ~/.zshrc"
echo ""
if [ -d "$DOTFILES_BACKUP_DIR" ]; then
    echo "💾 Your old configs backed up to: $DOTFILES_BACKUP_DIR"
fi