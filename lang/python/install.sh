#!/usr/bin/env bash

set -e

echo "Setting up Python..."

if command -v conda &> /dev/null; then
    conda_base="$(conda info --base 2>/dev/null || true)"
    echo "Conda is installed: $(conda --version)"
    if [ -n "$conda_base" ] && [ -x "$conda_base/bin/python3" ]; then
        echo "Miniconda Python is available: $("$conda_base/bin/python3" --version)"
    else
        echo "Miniconda Python not found under conda base"
    fi
else
    echo "Conda not found"
    echo "Install Miniconda with: brew install --cask miniconda"
fi

# Check Python version. System Python alone is not considered the configured runtime.
if command -v python3 &> /dev/null; then
    echo "Active Python: $(python3 --version) ($(command -v python3))"
    if [ -n "${conda_base:-}" ] && [ -x "$conda_base/bin/python3" ] && [ "$(command -v python3)" != "$conda_base/bin/python3" ]; then
        echo "Shell config will prefer Miniconda Python after sourcing zsh/zshrc.zsh"
    fi
else
    echo "Python3 not found"
fi

if command -v poetry &> /dev/null; then
    echo "Poetry is installed: $(poetry --version)"
else
    echo "Poetry not found"
    echo "Install Poetry with: brew install poetry"
fi

echo "Python setup complete"
