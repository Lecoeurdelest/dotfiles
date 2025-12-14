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