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

# Shortcuts
alias cd_cdaaas='cd_projetos; cd cdaaas/'
alias cd_cssaas='cd_projetos; cd cssaas/'
alias cd_drops='cd_projetos; cd drops/'
alias cd_esportes_services='cd ~/Projetos/esportes_services/'
alias cd_jsaas='cd_projetos; cd jsaas/'
alias cd_multicontent='cd_projetos; cd multi-content/'
alias cd_projetos='cd ~/Projetos/'
alias cd_router='cd_projetos; cd router/'
alias cd_workspace='cd ~/Workspace/'

alias services_up='cd_esportes_services; vagrant up'
alias services_down='cd_esportes_services; vagrant halt'

alias workon_cdaaas='workon_presentation; cd_cdaaas'
alias workon_cssaas='workon_presentation; cd_cssaas'
alias workon_drops='workon_presentation; cd_drops'
alias workon_jsaas='workon_presentation; cd_jsaas'
alias workon_multicontent='workon_presentation; cd_multicontent'
alias workon_presentation='workon presentation'
alias workon_router='workon_presentation; cd_router'

# Tools
alias netstat_osx='sudo lsof -i -P'
alias tm='top -o vsize' # memory
alias tu='top -o cpu' # cpu
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'

# Python tools
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pydist='python setup.py sdist upload -r ipypi'
alias pydev='python setup.py develop --no-deps'

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
