#!/usr/bin/env zsh

# =============================================================================
# Java Configuration
# =============================================================================

# Amazon Corretto 25
if [[ -d "/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk/Contents/Home" ]]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"
# Homebrew OpenJDK
elif [[ -d "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]]; then
    export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"
elif [[ -d "/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]]; then
    export JAVA_HOME="/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"
# Fallback to system java_home
elif command -v /usr/libexec/java_home &> /dev/null; then
    __java_home="$(/usr/libexec/java_home 2>/dev/null)"
    if [[ -n "$__java_home" && -d "$__java_home/bin" ]]; then
        export JAVA_HOME="$__java_home"
        export PATH="$JAVA_HOME/bin:$PATH"
    fi
    unset __java_home
fi
