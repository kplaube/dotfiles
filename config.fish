# Aliases
if test -f "$HOME/.my-aliases.fish"
    source "$HOME/.my-aliases.fish"
end
if test -f "$HOME/.my-aliases.private.fish"
    source "$HOME/.my-aliases.private.fish"
end

# Go
export GOPATH=$HOME/go

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin

# VSCode
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

# Rancher Desktop
set --export --prepend PATH "/Users/klaube/.rd/bin"

if status is-interactive
    pyenv init - fish | source
    nvm use lts >/dev/null 2>&1
end
