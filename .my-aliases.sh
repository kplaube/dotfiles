# Tools

if [[ uname == 'FreeBSD' ]]; then
    alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias netstat_osx='sudo lsof -i -P'
else
    alias mvim='gvim'
fi

alias fuck='eval $(thefuck $(fc -ln -1))'
alias tm='top -o vsize' # memory
alias tu='top -o cpu' # cpu
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'

# Python tools
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pydist='python setup.py sdist upload -r ipypi'
alias pydev='python setup.py develop --no-deps'
