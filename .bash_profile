# Python's virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true

# Ruby's RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Android Env
export PATH=${PATH}:/Applications/Android\ Studio.app/sdk/platform-tools:/Applications/Android\ Studio.app/sdk/tools
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Colors
export LSCOLORS="DxGxcxdxCxegedabagacad"
export PS1='\[\033[01;32m\]\u ➜  \[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# Customizing PATH
export ESPORTES_PATH=$HOME/Projetos/esportes
export GOPATH=$HOME/Workspace/go

PATH="/usr/local/heroku/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="${GOPATH}/bin:${PATH}"

export PATH

source ~/.my-aliases.sh
source ~/.my-global-vars.sh
