" Personal .vimrc of Erich Smith

" general settings
set nocompatible
set hidden      " allow unseen buffers
scriptencoding utf-8
set shortmess+=filmnrxoOtT  " abbreviate messages, and truncate if needed
let mapleader = ","

" autoload vim plugin bundles in ~/.vim/bundle dir...
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()


" colors
set background=dark
colorscheme solarized

" tabs & formatting
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab smarttab
set nowrap
set autoindent smartindent
filetype plugin indent on

" syntax & highlighting
set incsearch ignorecase smartcase hlsearch
syntax enable

" keep the cursor where I put it...
set nostartofline   " don't move the cursor to the first non-blank char when jumping
set virtualedit=all " cursor may move beyond last char in line

" let me know when a single line changes...
set report=0        " number of chars before reporting a changed file

" less cowbell, Martha...
set vb t_vb=

" use 'K' to look up words
set keywordprg=dict
set spell

" completion settings
set wildmenu        " crazy tab completion for Ex commands
set wildmode=list:longest,full

" menus and display
set lazyredraw      " speeds up macros, use <ctrl>-l to refresh screen as needed
set showtabline=2   " always display tab labels
set showmatch       " show matching brace pairs
set showcmd         " show partial normal mode commands in lower right
au BufWinLeave * silent! mkview   " make vim save view state
au BufWinEnter * silent! loadview " make vim load view state
set tabpagemax=10   " only show 10 tabs
set showmode        " show current mode
" set cursorline
"set number          " turn line numbering on
set list listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=\ [%LL]
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file
endif

" (re) mappings
map <down> <ESC>:bn<RETURN>
map <up> <ESC>:bp<RETURN>
map <right> <ESC>:tabnext<RETURN>
map <left> <ESC>:tabprevious<RETURN>

" easier window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remap 'U' (undo all changes on current line) to toggle GUndo plugin
nnoremap U :GundoToggle<CR>

" make Y consistent with C and D: yank to end of line
nnoremap Y y$

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Set F5 to toggle paste mode
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" %% expands to current file path...
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" ,e and ,v will open files in same dir as current file
map <leader>e :edit %%
map <leader>v :view %%
" ,, will bounce between last edited file, and the current one
map <leader><leader> <C-^>

" issuing 'w!!' will force a sudo save...
cmap w!! %!sudo tee > /dev/null %

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" in-place filters with grep...
command -nargs=+ HIDEALL %!grep -v <args>
command -nargs=+ SHOWONLY %!grep <args>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

    "" leader-T: write and test(execute) file in buffer
    ""map ,T :w\|:!rake<CR>

nnoremap ,t :CommandT<CR>
let g:CommandTMatchWindowReverse = 1

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

function! FindLongerLines()
    :set hls
    let @/ = '^.\{' . col('$') . '}'
    silent! norm n$
endfunction
map ,m :call FindLongerLines()<CR>:set hlsearch<CR>

" Powerline options
set t_Co=256
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'skwp'
let g:Powerline_colorscheme = 'skwp'

" bash support plugin options
let g:BASH_AuthorName   = 'Erich Smith'
let g:BASH_Email        = 'esmith@geomagic.com'
let g:BASH_Company      = 'Geomagic, Inc.'

command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" visual mode git blame line at cursor
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" cucumber test current buffer
map <Leader>cc :!cucumber --drb %<CR>

map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>

map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
map <Leader>rf :CommandTFlush<CR>:CommandT<CR>

map <Leader>rt q:?!ruby<cr><cr>

" rspec test current buffer
map <Leader>y :!rspec --drb %<cr>

" visual mode: rextract local variable
vnoremap <leader>relv :RExtractLocalVariable<cr>

" vim-xmpfilter
nmap <buffer> <leader>x :call xmpfilter#run('n')<CR>
vmap <buffer> <leader>x :call xmpfilter#run('v')<CR>

nmap <buffer> <leader>X :call xmpfilter#toggle_mark('n')<CR>
vmap <buffer> <leader>X :call xmpfilter#toggle_mark('v')<CR>

" vim-textmanip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" vim-scp-upload
let g:vim_scp_configs = {
           \}
