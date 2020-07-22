export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
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
#PATH=$PATH:$HOME/.rvm/bin

# Activate nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Activate lua env
export PATH=$PATH:$HOME/.luarocks/bin

# Activate go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Activate jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Activate flutter
export PATH="$HOME/Workspace/flutter/bin:$PATH"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/klaus/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/klaus/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/klaus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/klaus/google-cloud-sdk/path.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide user@hostname
prompt_context(){}

# load rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init - --no-rehash)"
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/klaus/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/klaus/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/klaus/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/klaus/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

