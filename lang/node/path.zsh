#!/usr/bin/env zsh

# =============================================================================
# Node.js Configuration
# =============================================================================

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
fi
if [[ -s "$NVM_DIR/bash_completion" ]]; then
    source "$NVM_DIR/bash_completion"
fi

# Global node_modules
if command -v npm &> /dev/null; then
    __npm_prefix="$(npm config get prefix 2>/dev/null)"
    if [[ -n "$__npm_prefix" && -d "$__npm_prefix/bin" ]]; then
        export PATH="$__npm_prefix/bin:$PATH"
    fi
    unset __npm_prefix
fi

# Yarn global
export PATH="$HOME/.yarn/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"