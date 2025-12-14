#!/usr/bin/env zsh

# =============================================================================
# Kubectl Configuration
# =============================================================================

# kubectl completion
if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
fi

# kubectl aliases
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias klf='kubectl logs -f'