## About

This repo provides a customized .vimrc and .vim/ config folder. It is one of the many ways to get started with exploring the tremendous features of vim.

## Setup

In order to use this repo, do the following in your home directory

Backup (or delete, if you haven't made any changes so far) your current .vimrc and, if present, .vim/ directory

* Backup:
  ```
  mv ~/.vimrc ~/.vimrc.bak
  mv ~/.vim/ ~/.vim.bak/
  ```
* Delete:
  ```
  rm ~/.vimrc
  rm -rf ~/.vim/
  ```

Then, clone the repo using:

`git clone https://github.com/hackstedt/.vim.git ~/.vim`

Softlink the repos' .vimrc to the $HOME/.vimrc:

`ln -s ~/.vim/.vimrc ~/.vimrc`

This repo uses Vundle, a bundle management system for vim which is hosted on github, too. Clone it:

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Finally, launch vim and run `:PluginInstall`
Alternatively install from command line: `vim +PluginInstall +qall`


## License

This .vimrc is, obviously, free software and licensed under GPL v3
