# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Activate Python stuff
pyenv virtualenvwrapper

# Activate my stuff
source ~/.my-global-vars.sh
source ~/.my-aliases.sh

# Enhance the vi-mode experience
bindkey '/' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history

export KEYTIMEOUT=1
