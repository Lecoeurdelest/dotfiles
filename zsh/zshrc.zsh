#!/usr/bin/env zsh

# =============================================================================
# Modular Zsh Configuration
# =============================================================================

DOTFILES_DIR="$HOME/Documents/dotfiles"

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

# Source Oh My Zsh
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source "$ZSH/oh-my-zsh.sh"
fi

# =============================================================================
# Load Modules
# =============================================================================

# Helper function to source files
source_if_exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

# Load core configs
source_if_exists "$DOTFILES_DIR/core/env.zsh"
source_if_exists "$DOTFILES_DIR/core/path.zsh"

# Load Homebrew
source_if_exists "$DOTFILES_DIR/homebrew/path.zsh"

# Load language configs
source_if_exists "$DOTFILES_DIR/lang/java/path.zsh"
source_if_exists "$DOTFILES_DIR/lang/python/path.zsh"
source_if_exists "$DOTFILES_DIR/lang/node/path.zsh"

# Load tool configs
source_if_exists "$DOTFILES_DIR/tools/docker/path.zsh"
source_if_exists "$DOTFILES_DIR/tools/kubectl/path.zsh"
source_if_exists "$DOTFILES_DIR/tools/terraform/path.zsh"

# Load zsh specific configs
source_if_exists "$DOTFILES_DIR/zsh/aliases.zsh"
source_if_exists "$DOTFILES_DIR/zsh/functions.zsh"

# Load private configs (not committed to git)
source_if_exists "$DOTFILES_DIR/private/env.zsh"
source_if_exists "$DOTFILES_DIR/private/overrides.zsh"

# =============================================================================
# Module Loading Complete
# =============================================================================