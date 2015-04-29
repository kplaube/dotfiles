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
alias cd_admin_components='cd_projetos; cd admin-components/'
alias cd_cdaaas='cd_projetos; cd cdaaas/'
alias cd_cmaas='cd_projetos; cd cmaas/'
alias cd_cssaas='cd_projetos; cd cssaas/'
alias cd_drops='cd_projetos; cd drops/'
alias cd_globoui='cd_projetos; cd globo-ui/'
alias cd_jsaas='cd_projetos; cd jsaas/'
alias cd_metadata='cd_projetos; cd metadata/'
alias cd_mobilefilter='cd_projetos; cd mobile-filter/'
alias cd_mobilemiddleware='cd_projetos; cd mobile-middleware/'
alias cd_multicontent='cd_projetos; cd multi-content/'
alias cd_projetos='cd ~/Projetos/'
alias cd_roadie='cd_projetos; cd roadie/'
alias cd_router='cd_projetos; cd router/'
alias cd_workspace='cd ~/Workspace/'

alias services_up='mysql.server start'
alias services_down='mysql.server stop'

alias workon_admin_components='cd_admin_components'
alias workon_cdaaas='workon_presentation; cd_cdaaas'
alias workon_cmaas='workon_presentation; cd_cmaas'
alias workon_cssaas='workon_presentation; cd_cssaas'
alias workon_drops='workon_presentation; cd_drops'
alias workon_globoui='workon globoui; cd_globoui'
alias workon_jsaas='workon_presentation; cd_jsaas'
alias workon_metadata='workon_plataforma; cd_metadata'
alias workon_mobilefilter='workon_plataforma; cd_mobilefilter'
alias workon_mobilemiddleware='workon_plataforma; cd_mobilemiddleware'
alias workon_multicontent='workon_presentation; cd_multicontent'
alias workon_plataforma='workon plataforma'
alias workon_presentation='workon presentation; cd_projetos'
alias workon_roadie='workon_presentation; cd_roadie'
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

source ~/.global_vars
