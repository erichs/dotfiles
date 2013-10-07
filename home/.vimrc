let mapleader = ";"

" load Pathogen stuff
filetype on
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"Custom Configs include.
" All custom config settings are stored in the .vim/config folder to
" differentiate them from 3rd-party libraries.
runtime! config/**/*
set clipboard=unnamed

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
nmap <F8> :TagbarToggle<CR>
