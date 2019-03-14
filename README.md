# My dotfiles

A set of aliases, small tools, and vim configuration that makes my life easier.

## Dependencies

- Editor:
  - [Vim](https://github.com/vim/vim) (and why not [MacVim](https://github.com/macvim-dev/macvim)?)
  - [Visual Studio Code](https://code.visualstudio.com/)
- Shell:
  - [direnv](https://direnv.net/): Environment switcher for the shell
  - [iTermocil](https://github.com/TomAnthony/itermocil): pre-configured layouts of windows and panes in iTerm2 (Mac only)
  - [Zsh](http://www.zsh.org/): A cool alternative for Bash
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/): Community-driven framework for managing zsh configuration

## Installing

First of all, you'll need to install [direnv](https://direnv.net/index.html#install), [iTermocil](https://github.com/TomAnthony/itermocil#installing-itermocil), Zsh, [Vim](https://apple.stackexchange.com/questions/325697/installation-of-mac-brew-vim-version-8-1), and [VS Code](https://code.visualstudio.com/docs/setup/setup-overview) by using your system's package manager.

Afterwards, you'll need to install oh-my-zsh:

    $ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

You can install the scripts through the following command:

    $ make install

### Fonts

In order to use vim-airline and nerdtree without any kind of problem regarding fonts, it's recommended to install and use the [Droid Sans Mono for Powerline.otf](https://github.com/kplaube/dotfiles/blob/master/fonts/Droid%20Sans%20Mono%20for%20Powerline.otf) font file.

## Shortcuts

### My aliases:

- `netstat_osx`: Shortcut for `sudo lsof -i -P`
- `tm`: Shows memory information (shortcut for `top -o vsize`)
- `tree`: Shows the current folder as a tree
- `tu`: Shows CPU information (shortcut for `top -o cpu`)

### oh-my-zsh

- [git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)

Enjoy :)
