# General system-wide settings
# ----

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Language-specific settings
# ----

# Go
export GOPATH="$HOME/go"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Pyevn
export PYENV_ROOT="$HOME/.pyenv"

if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
elif command -v brew >/dev/null 2>&1 && [ -d "$(brew --prefix pyenv 2>/dev/null)/bin" ]; then
    export PATH="$(brew --prefix pyenv)/bin:$PATH"	
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Rust
[[ -d $HOME/.cargo ]] && bash $HOME/.cargo/env
