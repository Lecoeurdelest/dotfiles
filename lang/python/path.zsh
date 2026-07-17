#!/usr/bin/env zsh

# =============================================================================
# Python & Conda Configuration
# =============================================================================

__path_prepend_once() {
    [[ -d "$1" ]] || return
    path=("${path[@]:#$1}")
    path=("$1" $path)
}

__miniconda_home=""
for __conda_candidate in \
    "/opt/homebrew/Caskroom/miniconda/base" \
    "/usr/local/Caskroom/miniconda/base" \
    "$HOME/miniconda3"
do
    if [[ -x "$__conda_candidate/bin/conda" ]]; then
        __miniconda_home="$__conda_candidate"
        break
    fi
done

# Prefer Miniconda over system Python when it is installed.
if [[ -n "$__miniconda_home" ]]; then
    __conda_setup="$("$__miniconda_home/bin/conda" "shell.zsh" "hook" 2> /dev/null)"
    if [[ $? -eq 0 && -n "$__conda_setup" ]]; then
        eval "$__conda_setup"
    else
        if [[ -f "$__miniconda_home/etc/profile.d/conda.sh" ]]; then
            . "$__miniconda_home/etc/profile.d/conda.sh"
        else
            __path_prepend_once "$__miniconda_home/condabin"
        fi
    fi
    __path_prepend_once "$__miniconda_home/condabin"
    __path_prepend_once "$__miniconda_home/bin"
    unset __conda_setup
fi

# Python user packages
__path_prepend_once "$HOME/.local/bin"

unset -f __path_prepend_once
unset __miniconda_home __conda_candidate
