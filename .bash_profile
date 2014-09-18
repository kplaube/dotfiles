# Python's virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true

# Ruby's RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Shortcuts
alias cd_componentes='cd ~/Projetos/componentes-marketplace/componentes'
alias cd_esportes='cd ~/Projetos/esportes/esportes'
alias cd_esportes_services='cd ~/Projetos/esportes_services'
alias cd_globoesporte_core='cd ~/Projetos/globoesporte-core/globoesporte'
alias cd_projetos='cd ~/Projetos/'
alias cd_workspace='cd ~/Workspace'

alias services_up='cd_esportes_services; vagrant up'
alias services_down='cd_esportes_services; vagrant halt'

alias workon_esportes='workon esportes'
alias workon_componentes='workon_esportes; cd_componentes'
alias workon_globoesporte_core='workon_esportes; cd_globoesporte_core'

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
PATH="/usr/local/heroku/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

export PATH
