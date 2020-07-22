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

# Activate direnv
eval "$(direnv hook zsh)"

# Activate local Python
eval "$(pyenv init -)"

# Activate nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Activate flutter
export PATH="$HOME/Workspace/flutter/bin:$PATH"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/klaus/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/klaus/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/klaus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/klaus/google-cloud-sdk/path.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide user@hostname
prompt_context(){}
