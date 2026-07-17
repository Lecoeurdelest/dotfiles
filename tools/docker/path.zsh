#!/usr/bin/env zsh

# =============================================================================
# Docker Configuration
# =============================================================================

__path_prepend_once() {
    [[ -d "$1" ]] || return
    case ":$PATH:" in
        *":$1:"*) ;;
        *) export PATH="$1:$PATH" ;;
    esac
}

# Docker Desktop CLI tools
__path_prepend_once "/Applications/Docker.app/Contents/Resources/bin"

# Docker completion
if command -v docker &> /dev/null && [[ -f "$HOME/.docker/completions/docker.zsh-completion" ]]; then
    if (( ${fpath[(Ie)$HOME/.docker/completions]} == 0 )); then
        fpath=("$HOME/.docker/completions" $fpath)
    fi
    if ! whence -w compdef &> /dev/null; then
        autoload -Uz compinit && compinit
    fi
fi

unset -f __path_prepend_once
