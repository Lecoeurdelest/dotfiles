#!/usr/bin/env bash

set -e

echo "📦 Setting up Ruby..."

# Check if Ruby is installed
if command -v ruby &> /dev/null; then
    echo "Ruby is installed: $(ruby --version)"
else
    echo "Ruby not found"
    echo "Install Ruby with: brew install ruby"
fi

# Check if rbenv is installed
if command -v rbenv &> /dev/null; then
    echo "rbenv is installed"
    echo "Current Ruby version: $(rbenv version)"
else
    echo "rbenv not found"
    echo "Install rbenv with: brew install rbenv"
    echo "Then: rbenv install <version>"
fi

# Check if gem is available
if command -v gem &> /dev/null; then
    echo "Gem is available: $(gem --version)"
fi

# Check if docker-sync is installed
if command -v docker-sync &> /dev/null; then
    echo "docker-sync is installed: $(docker-sync --version)"
else
    echo "docker-sync not found (optional)"
    echo "Install with: gem install docker-sync"
fi

echo "Ruby setup complete"
