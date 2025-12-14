#!/usr/bin/env zsh

# =============================================================================
# Aliases
# =============================================================================

# PostgreSQL
alias pg='psql -h localhost -p 5432 -U $(whoami)'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Dotfiles management
alias dotfiles='cd ~/Documents/dotfiles'
alias reload='source ~/.zshrc'

# System
alias c='clear'
alias h='history'
alias mkdir='mkdir -pv'

# Network
alias myip='curl ifconfig.me'
alias ports='netstat -tulanp'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'