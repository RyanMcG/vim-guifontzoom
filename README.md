# guifontzoom.vim

## Purpose

Easily zoom in or zoom out (i.e. increase and decrease guifont size with gvim).
Currently, this plugin only works with GTK.

## Implementation

This is not my code. I simply moved a few things around and made this repository
so I could easily install [a gist (called
gtkfont.vim)](https://gist.github.com/4101252) created by github user
[menski](https://github.com/menski).

I did make a couple of minor improvements though. I changed the mappings to the following:

```vim
nmap <silent> <leader>zi :ZoomIn<CR>
nmap <silent> <leader>zo :ZoomOut<CR>
nmap <silent> <leader>zr :ZoomReset<CR>
```

Also, this version works with float font sizes.

## Installation

Use [vundle](https://github.com/gmarik/vundle) or
[pathogen](https://github.com/tpope/vim-pathogen).
