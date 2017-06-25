export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(autoenv nvm python pyenv rvm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Personal aliases
source ~/.my-aliases.sh

# Activate rvm
PATH=$PATH:$HOME/.rvm/bin

# Activate lua env
export PATH=$PATH:$HOME/.luarocks/bin
