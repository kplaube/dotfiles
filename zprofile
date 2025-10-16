
# Go
export GOPATH="$HOME/go"

# Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

#
# Mac-specific
#

# OrbStack
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
