export ZSH=~/.oh-my-zsh

ZSH_THEME="cobalt2"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

# Personal aliases
source ~/.my-aliases.sh

# Tradeshift
source ~/.tradeshift/settings

# Activate direnv
eval "$(direnv hook zsh)"

# Activate local Python
eval "$(pyenv init -)"

# Activate rvm
PATH=$PATH:$HOME/.rvm/bin

# Activate nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Activate lua env
export PATH=$PATH:$HOME/.luarocks/bin

# Activate go path
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOPATH/bin

# Activate jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/klaus/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/klaus/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/klaus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/klaus/google-cloud-sdk/path.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
