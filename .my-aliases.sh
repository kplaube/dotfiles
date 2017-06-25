# Tools

OS=$(uname)

if [ "$OS" = "Darwin" ]; then
    alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias netstat_osx='sudo lsof -i -P'
    alias tm='top -o vsize' # memory
    alias tu='top -o cpu' # cpu
else
    alias mvim='gvim'
    alias emacs=/usr/bin/emacs25
fi

alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'
