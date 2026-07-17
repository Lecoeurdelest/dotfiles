#!/usr/bin/env bash

set -e

echo "Setting up Terraform..."

if command -v terraform &> /dev/null; then
    echo "Terraform is installed: $(terraform version -json 2>/dev/null | jq -r '.terraform_version' 2>/dev/null || terraform version | head -n 1)"
else
    echo "Terraform not found"
    echo "Install Terraform with: brew install hashicorp/tap/terraform"
fi

echo "Terraform setup complete"
