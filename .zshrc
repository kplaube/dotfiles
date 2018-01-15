export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(autoenv golang nvm python pyenv rvm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

# Personal aliases
source ~/.my-aliases.sh

# Activate local Python
PATH=$PATH:$HOME/Library/Python/2.7/bin

# Activate rvm
PATH=$PATH:$HOME/.rvm/bin

# Activate lua env
export PATH=$PATH:$HOME/.luarocks/bin

# Activate go path
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOPATH/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/klaus/Workspace/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/klaus/Workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/klaus/Workspace/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/klaus/Workspace/google-cloud-sdk/completion.zsh.inc'; fi
