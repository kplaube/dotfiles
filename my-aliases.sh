# Shortcuts

alias workon_dotfiles="cd $HOME/Workspace/dotfiles/"

# Git workflow helpers

alias gpm="git checkout main; git pull origin main --rebase -f"
alias gpd="git checkout develop; git pull origin develop --rebase -f"
alias gprm="gpm; git checkout -; git rebase main"
alias gprd="gpd; git checkout -; git rebase develop"
