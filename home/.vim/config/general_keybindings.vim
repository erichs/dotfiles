" Use <Leader><Leader> as a shortcut to enter commands (faster and less strain
"  than hitting Shift-: in most cases).
nnoremap <Leader><Leader> :

""" Writing Buffers / Quitting
""""""""""""""""""""""""""""""
" Keybinds for quickly writing files and/or closing windows

" <Leader>w writes the current buffer to disk.
map <Leader>w :w!<CR>

" <Leader>W writes the current buffer to disk and quits the window.
map <Leader>W :wq!<CR>

" <Leader>q quits the current window
map <Leader>q :q!<CR>

" <Leader>Q quits all windows.
map <Leader>Q :qa!<CR>

" issuing 'w!!' will force a sudo save...
cmap w!! %!sudo tee > /dev/null %

" navigate buffers and tabs
map <down> <ESC>:bn<RETURN>
map <up> <ESC>:bp<RETURN>
map <right> <ESC>:tabnext<RETURN>
map <left> <ESC>:tabprevious<RETURN>

" Switch back to the last buffer you were looking at.
map <Leader>b <C-^>

""" Other
"""""""""

" Use <Leader>v to reload the vim config.
map <Leader>v :so ~/.vimrc<CR>

" Make Y behave like D, A, I, etc.
map Y y$

" Make Q repeat the last recorded macro
map Q @@

" ;i will toggle display of hidden characters
noremap <Leader>i :set list!<CR>

" Hit escape twice to clear highlights.
noremap <silent><Esc><Esc> :nohls<CR>

" Use <C-space> as an escape alternative
imap <C-@> <C-[>
vmap <C-@> <C-[>
if has("gui")
  imap <C-Space> <C-[>
  vmap <C-Space> <C-[>
endif

" Keep search results in the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Set F5 to toggle paste mode
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>
