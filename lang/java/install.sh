#!/usr/bin/env bash

set -e

echo "Setting up Java..."

# Check if Java is installed. macOS may provide a java shim even without a JDK.
if java -version &> /dev/null; then
    echo "Java is installed: $(java -version 2>&1 | head -n 1)"
elif [ -x "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home/bin/java" ]; then
    echo "Java is installed: $(/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home/bin/java -version 2>&1 | head -n 1)"
    echo "JAVA_HOME will be set by lang/java/path.zsh"
elif [ -x "/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home/bin/java" ]; then
    echo "Java is installed: $(/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home/bin/java -version 2>&1 | head -n 1)"
    echo "JAVA_HOME will be set by lang/java/path.zsh"
else
    echo "Java not found"
    echo "Install Java with: brew install openjdk"
fi

# Check for Amazon Corretto
if [ -d "/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk" ]; then
    echo "Amazon Corretto 25 detected"
elif [ -d "/Library/Java/JavaVirtualMachines" ]; then
    echo "Installed JDKs:"
    ls -1 /Library/Java/JavaVirtualMachines/
fi

echo "Java setup complete"