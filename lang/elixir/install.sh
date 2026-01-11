#!/usr/bin/env bash

set -e

echo "📦 Setting up Elixir..."

# Check if Erlang is installed
if command -v erl &> /dev/null; then
    echo "Erlang is installed: $(erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erts_vsn:system_version(), "OTP_VERSION"])), io:format("~s", [Version])' -s init stop 2>/dev/null || erl +V 2>&1 | head -1)"
else
    echo "Erlang not found"
    echo "Install Erlang with: brew install erlang"
fi

# Check if Elixir is installed
if command -v elixir &> /dev/null; then
    echo "Elixir is installed: $(elixir --version)"
else
    echo "Elixir not found"
    echo "Install Elixir with: brew install elixir"
fi

# Check if Mix is available
if command -v mix &> /dev/null; then
    echo "Mix is available: $(mix --version)"
fi

# Check if iex is available
if command -v iex &> /dev/null; then
    echo "IEx (Elixir REPL) is available"
fi

echo "Elixir setup complete"
