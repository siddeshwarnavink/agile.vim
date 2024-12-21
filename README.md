# agile.vim

Quickly navigate through code in Vim. Specifically made for working 
in remote environments.

* Improves netrw experience. Use `-` to go up a directory.
* `:LastEdit` to go to the where you last edited a file.
* Use built-in `:find` and hit tab to get auto complete. Use `Ctrl-P` and 
  `Ctrl-N` to go up and down the list.
* `:Gfind` to fuzzy find files in your get repository.
* `:Grep` (with optional ripgrep support).

## Installation

For remote environments, install using Vim's default package manager

    mkdir -p ~/.vim/pack/plugins/start
    cd ~/.vim/pack/plugins/start
    git clone https://github.com/siddeshwarnavink/agile.vim.git

Or if you on a local machine, install using your favorite package manager, here
is instruction to install with [Plug](https://github.com/junegunn/vim-plug)

    Plug 'siddeshwarnavink/agile.vim'
