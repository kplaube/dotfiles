# !/bin/bash

[[ -s "$HOME/.my-aliases.private.sh" ]] && source "$HOME/.my-aliases.private.sh"

# Shortcuts
# ----
alias workon_dotfiles="cd $HOME/Workspace/dotfiles/"

# Git workflow helpers
# ----
alias gcb="git checkout -b"
alias gpm="git checkout main; git pull origin main --rebase -f"
alias gpma="git checkout master; git pull origin master --rebase -f"
alias gpd="git checkout develop; git pull origin develop --rebase -f"
alias gprm="gpm; git checkout -; git rebase main"
alias gprma="gpma; git checkout -; git rebase master"
alias gprd="gpd; git checkout -; git rebase develop"
