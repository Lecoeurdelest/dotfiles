#!/usr/bin/env bash

set -e

echo "📦 Setting up Node.js..."

# Check if node is installed
if command -v node &> /dev/null; then
    echo "Node.js is installed: $(node --version)"
    echo "NPM version: $(npm --version)"
else
    echo "Node.js not found"
    echo "Install Node.js with:"
    echo "   - brew install node (via Homebrew)"
    echo "   - Or install nvm: https://github.com/nvm-sh/nvm"
fi

# Check for yarn
if command -v yarn &> /dev/null; then
    echo "Yarn is installed: $(yarn --version)"
fi

echo "Node.js setup complete"