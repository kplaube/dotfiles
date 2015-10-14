# Tools
mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}

alias fuck='eval $(thefuck $(fc -ln -1))'
alias netstat_osx='sudo lsof -i -P'
alias tm='top -o vsize' # memory
alias tu='top -o cpu' # cpu
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'
alias zshconfig="vim ~/.zshrc"

# Python tools
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pydist='python setup.py sdist upload -r ipypi'
alias pydev='python setup.py develop --no-deps'

# Shortcuts
alias cd_admin_components='cd_projetos; cd admin-components/'
alias cd_backstage_ui='cd_projetos; cd ui/'
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
alias cd_photo_api='cd_projetos; cd photo-api/'
alias cd_projetos='cd ~/Projetos/'
alias cd_roadie='cd_projetos; cd roadie/'
alias cd_router='cd_projetos; cd router/'
alias cd_shiatsu='cd_projetos; cd shiatsu/'
alias cd_workspace='cd ~/Workspace/'

alias workon_admin_components='cd_admin_components'
alias workon_backstage_ui='workon_presentation; cd_backstage_ui'
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
alias workon_photo_api='workon_presentation; cd_photo_api'
alias workon_plataforma='workon plataforma'
alias workon_presentation='workon presentation; cd_projetos'
alias workon_roadie='workon_presentation; cd_roadie'
alias workon_router='workon_presentation; cd_router'
alias workon_shiatsu='workon_presentation; cd_shiatsu'
