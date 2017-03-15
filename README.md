My dotfiles
===========

A set of aliases and small tools that makes my life easier.

Dependencies
------------

I strongly recommend you to use
[Zsh](http://www.zsh.org/) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/). It's a
wonderful framework that automates a lot of work you do in your daily routine.

Installing
----------

First of all, you'll need to install oh-my-zsh:

```$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

You can install the scripts through the following command:

```$ make install```

For development purposes, you can make a symbolic link using another `make` task:

```$ make develop```

Emacs and init.el
-----------------

It's not mandatory to use [Emacs](https://www.gnu.org/software/emacs/), but if you
do, you'll need the `emacs 2.5+`.

This configuration has some good stuff, like a Python environment, project management
and git integration.

Enjoy :)
