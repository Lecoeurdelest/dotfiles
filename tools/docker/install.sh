#!/usr/bin/env bash

set -e

echo "Setting up Docker..."

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo "Docker is installed: $(docker --version)"
else
    echo "Docker not found"
    echo "Install Docker with: brew install --cask docker"
fi

# Check if Docker Desktop app exists
if [[ -d "/Applications/Docker.app" ]]; then
    echo "Docker Desktop app detected"
else
    echo "Docker Desktop app not found"
fi

# Check if docker-sync is installed
if command -v docker-sync &> /dev/null; then
    echo "docker-sync is installed: $(docker-sync --version)"
else
    echo "docker-sync not found"
    echo "Install docker-sync with: gem install docker-sync"
fi

echo "Docker setup complete"