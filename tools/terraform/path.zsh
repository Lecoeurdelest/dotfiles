#!/usr/bin/env zsh

# =============================================================================
# Terraform Configuration
# =============================================================================

# Homebrew installs HashiCorp tools here on Apple Silicon.
if [[ -d "/opt/homebrew/bin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Homebrew installs HashiCorp tools here on Intel Macs.
if [[ -d "/usr/local/bin" ]]; then
    export PATH="/usr/local/bin:$PATH"
fi
