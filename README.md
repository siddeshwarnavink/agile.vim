# betterfind.vim

A very simple plugin that makes Vim's default find command into a simple fuzzy
finder.

* Just use `:find` and hit tab to get auto complete. Use `Ctrl-P` and `Ctrl-N`
  to go up and down the list.
* Use `:GFind` or simply `:Gf` to fuzzy find files in your get repository.

## Installation

Install using your favourite package manager, here is instruction to install 
with [Plug](https://github.com/junegunn/vim-plug)

    Plug 'siddeshwarnavink/betterfind.vim'

## Keybinding

betterfind.vim comes with default keybindings, though you can easily disable 
them by using `let g:betterfind_map_keys = 0`

* `ff` - Find files in directory.
* `fg` - Find files in git repository.
