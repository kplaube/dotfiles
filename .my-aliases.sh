# Tools

if [[ uname == 'Darwin' ]]; then
    alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias netstat_osx='sudo lsof -i -P'
    alias tm='top -o vsize' # memory
    alias tu='top -o cpu' # cpu
else
    alias mvim='gvim'
    alias emacs=/usr/bin/emacs25
fi

alias fuck='eval $(thefuck $(fc -ln -1))'
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'

# Python tools
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pydist='python setup.py sdist upload -r ipypi'
alias pydev='python setup.py develop --no-deps'
