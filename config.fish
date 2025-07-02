if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
if test -f "$HOME/.my-aliases.fish"
    source "$HOME/.my-aliases.fish"
end
if test -f "$HOME/.my-aliases.private.fish"
    source "$HOME/.my-aliases.private.fish"
end

# Go
export GOPATH=$HOME/go

# VSCode
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

# Pyenv
pyenv init - fish | source

# NVM
export NVM_DIR="$HOME/.nvm"
if test -f "$NVM_DIR/nvm.fish"
    source "$NVM_DIR/nvm.fish"
end