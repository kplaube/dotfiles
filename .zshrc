export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

# Personal aliases
source ~/.my-aliases.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide user@hostname
prompt_context(){}
