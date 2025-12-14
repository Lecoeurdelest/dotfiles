#!/usr/bin/env bash

set -e

echo "Setting up Java..."

# Check if Java is installed
if command -v java &> /dev/null; then
    echo "Java is installed: $(java -version 2>&1 | head -n 1)"
else
    echo "Java not found"
    echo "Install Java with: brew install --cask temurin"
fi

# Check for Amazon Corretto
if [ -d "/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk" ]; then
    echo "Amazon Corretto 25 detected"
elif [ -d "/Library/Java/JavaVirtualMachines" ]; then
    echo "Installed JDKs:"
    ls -1 /Library/Java/JavaVirtualMachines/
fi

echo "Java setup complete"