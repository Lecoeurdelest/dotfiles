#!/usr/bin/env zsh

# =============================================================================
# Docker Configuration
# =============================================================================

# Docker Desktop CLI tools
if [[ -d "/Applications/Docker.app/Contents/Resources/bin" ]]; then
    export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
fi

# Docker completion
if command -v docker &> /dev/null && [[ -f "$HOME/.docker/completions/docker.zsh-completion" ]]; then
    fpath=(~/.docker/completions $fpath)
    autoload -Uz compinit && compinit
fi

# =============================================================================
# docker-sync Configuration
# =============================================================================

# docker-sync completion
if command -v docker-sync &> /dev/null; then
    # Add docker-sync completions if available
    if [[ -f "$HOME/.docker-sync/completions/docker-sync.zsh" ]]; then
        source "$HOME/.docker-sync/completions/docker-sync.zsh"
    fi
fi