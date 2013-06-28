" Automatically restore cursor position when possible
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \ exe "normal! g`\"" |
   \ endif

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" chmod +x on file when appropriate
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

" teach VIM about new filetypes
au BufNewFile,BufRead *.inc set filetype=sh
