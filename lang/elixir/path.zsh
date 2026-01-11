#!/usr/bin/env zsh

# =============================================================================
# Elixir Configuration
# =============================================================================

# Erlang and Elixir paths (if installed via Homebrew)
if command -v erl &> /dev/null; then
    export ERL_AFLAGS="-kernel shell_history enabled"
fi

# Elixir Mix environment
export MIX_ENV="${MIX_ENV:-dev}"

# Mix local bin directory (for locally installed Mix escript packages)
export PATH="$HOME/.mix/escripts:$PATH"

# Elixir formatter configuration
export ELIXIR_FORMATTER_ALIGN_OPERATORS=true

# OTP (Open Telecom Platform) settings
export OTP_VERSION=$(erl -eval 'io:format("~s",[erlang:system_info(otp_release)])' -s init stop 2>/dev/null) || true
