"" Colorscheme stuff
" Enable syntax highlighting
syntax enable
" Use a dark background, because that's what cool people do, I'm told
set background=dark
" Use solarized
colorscheme solarized

" Status bar stuff
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

" Display coordinates in the status bar
set ruler
" Display unfinished commands in the status bar
set showcmd
" Display the current file mode in the status bar
set showmode

"" Other stuff
" Show matching bracket/etc.
set showmatch
" Show filename in title bar
set title

" Highlight trailing whitespace on non-empty lines, but not in insert mode.
highlight ExtraWhitespace ctermbg=red guibg=Brown
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/

set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

set lazyredraw      " speeds up macros, use <ctrl>-l to refresh screen as needed

au BufWinLeave * silent! mkview   " make vim save view state
au BufWinEnter * silent! loadview " make vim load view state
