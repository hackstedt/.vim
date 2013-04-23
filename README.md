## About

This repo provides a customized .vimrc and .vim/ config folder. It is one of the many ways to get started with exploring the tremendous features of vim.

## Setup

In order use this repo, do the following in your home directory

Backup (or delete, if you haven't made any changes so far) your current .vimrc and, if present, .vim/ directory

* Backup:

        mv .vimrc .vimrc.bak
        mv .vim/ .vim.bak/

* Delete:

        rm .vimrc
        rm -rf .vim/


Then, clone the repo using

        git clone git://github.com/hackstedt/.vim.git ~/.vim

Finally (and this might be an inconvenient solution, but we're open for suggestions), hardlink the repos' .vimrc to the $HOME/.vimrc:

        ln .vim/.vimrc .vimrc

This repo uses vundle, a bundle management system for vim which is hosted on github, too. Clone it:

        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Finally, start vim (or vi, if aliased). Enter command mode and perform a BundleInstall typing

        :BundleInstall

## License

This .vimrc is, obviously, free software and licensed under GPL v3
