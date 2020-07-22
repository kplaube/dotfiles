# Tools

OS=$(uname)

if [ "$OS" = "Darwin" ]; then
    alias netstat_osx='sudo lsof -i -P'
    alias tm='top -o vsize' # memory
    alias tu='top -o cpu' # cpu
fi

alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'
