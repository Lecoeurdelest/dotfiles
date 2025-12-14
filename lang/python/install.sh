#!/usr/bin/env bash

set -e

echo "Setting up Python..."

# Check if conda is installed
if command -v conda &> /dev/null; then
    echo "Conda is installed: $(conda --version)"
else
    echo "Conda not found"
    echo "Install Miniconda with: brew install --cask miniconda"
fi

# Check Python version
if command -v python3 &> /dev/null; then
    echo "Python is installed: $(python3 --version)"
else
    echo "Python3 not found"
fi

echo "Python setup complete"