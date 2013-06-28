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
