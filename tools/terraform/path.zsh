#!/usr/bin/env zsh

# =============================================================================
# Terraform Configuration
# =============================================================================

__path_prepend_once() {
    [[ -d "$1" ]] || return
    case ":$PATH:" in
        *":$1:"*) ;;
        *) export PATH="$1:$PATH" ;;
    esac
}

# Homebrew installs HashiCorp tools here on Apple Silicon.
__path_prepend_once "/opt/homebrew/bin"

# Homebrew installs HashiCorp tools here on Intel Macs.
__path_prepend_once "/usr/local/bin"

unset -f __path_prepend_once
