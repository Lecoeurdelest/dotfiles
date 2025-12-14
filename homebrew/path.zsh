#!/usr/bin/env zsh

# =============================================================================
# Homebrew Configuration
# =============================================================================

# Apple Silicon (M1/M2)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
# Intel Mac
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# PostgreSQL 15
if [[ -d "/opt/homebrew/opt/postgresql@15/bin" ]]; then
    export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
fi