#!/usr/bin/env zsh

# =============================================================================
# Ruby Configuration
# =============================================================================

# rbenv (Ruby version manager)
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi

# Gem configuration
if command -v gem &> /dev/null; then
    # Add user gem binaries to PATH
    export PATH="$HOME/.gem/ruby/*/bin:$PATH"
fi

# Ruby compilation flags (if using rbenv)
if command -v rbenv &> /dev/null; then
    export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
fi
