#!/usr/bin/env bash

set -e

echo "Setting up kubectl..."

# Check if kubectl is installed
if command -v kubectl &> /dev/null; then
    echo "kubectl is installed: $(kubectl version --client --short 2>/dev/null || kubectl version --client)"
else
    echo "kubectl not found"
    echo "Install kubectl with: brew install kubectl"
fi

echo "✅ kubectl setup complete"