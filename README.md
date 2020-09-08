# My dotfiles

A set of aliases, small tools, and vim configuration that makes my life easier.

## Dependencies

- Editor:
  - [Vim](https://github.com/vim/vim)
  - [Visual Studio Code](https://code.visualstudio.com/)
- Shell:
  - [Zsh](http://www.zsh.org/): A cool alternative for Bash
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/): Community-driven framework for managing zsh configuration

## Installing

First of all, you'll need to install [VS Code](https://code.visualstudio.com/docs/setup/setup-overview) by using your system's package manager.

The rest can be installed through the following command:

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
