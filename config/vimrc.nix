''
" Load filetype settings, plugins, and maps
if has('autocmd')
    let g:maplocalleader = ','
    filetype plugin indent on
endif

" Options dependent on the syntax feature
if has('syntax')
  " Use syntax highlighting
  if !exists('g:syntax_on')
    syntax enable
  endif

  " Use my colorscheme if using the GUI or if we have 256 colors
  if has('gui_running') || &t_Co >= 256
    silent! colorscheme nord
  endif

  " If not nord, then default with dark background
  if !exists('g:colors_name')
    set background=dark
  endif
endif

" The all-important default indent settings; filetypes to tweak
set autoindent     " Use indent of previous line on new lines
set expandtab      " Use spaces instead of tabs
set shiftwidth=4   " Indent with four spaces
set softtabstop=4  " Insert four spaces with tab key

" Let me backspace over pretty much anything
set backspace+=eol     " Line breaks
set backspace+=indent  " Spaces from 'autoindent'
set backspace+=start   " The start of current insertion


" Try to keep backups in one system-appropriate dir
set writebackup
set nobackup
set backupcopy=auto
set backupdir^=~/.cache/backup
set backupext=.bak

" Add some paths not to back up
set backupskip^=/dev/shm/*  " Shared memory RAM disk
set backupskip^=/var/tmp/*  " Debian's $TMPDIR for sudoedit(8)
if !has('unix')
  set backupskip-=/dev/shm/*
  set backupskip-=/var/tmp/*
endif

" Indent wrapped lines
silent! set breakindent

" Clear default 'comments' value, let the filetype handle it
set comments=

" Add completion options
if exists('+completeopt')
  set completeopt+=longest  " Insert longest common substring
  set completeopt+=menuone  " Show the menu even if only one match
endif

" Give me a prompt instead of just rejecting risky :write, :saveas
set confirm

" Only turn on 'cursorline' if my colorscheme loaded
if exists('+cursorline')
  if exists('g:colors_name') && g:colors_name ==# 'nord'
    set cursorline
  endif
endif

" Try to keep swapfiles in one system-appropriate dir
set swapfile
set directory^=~/.cache/swap//

" Use UTF-8 if we can and env LANG didn't tell us not to
if has('multi_byte') && !exists('$LANG') && &encoding ==# 'latin1'
  set encoding=utf-8
endif

" Don't wait for a key after Escape in insert mode
" In vim-tiny but not NeoVim, so just suppress errors
silent! set noesckeys

" Fold based on indent, but only when I ask
if has('folding')
  set foldlevelstart=99
  set foldmethod=indent
  set foldcolumn=4
endif

" Delete comment leaders when joining lines, if supported
silent! set formatoptions+=j

" If available, use GNU grep niceties for searching
if system('grep --version') =~# '^grep (GNU grep)'
  set grepprg=grep\ -HnRs\ --exclude='.git*'
endif

" Don't load GUI menus; set here before GUI starts
if has('gui_running')
  set guioptions+=M
endif

" Allow buffers to have changes without being displayed
set hidden

" Keep much more command and search history
set history=2000

" Highlight completed searches; clear on reload
set hlsearch
if 1
  nohlsearch
endif

" Don't assume I'm editing C; let the filetype set this
set include=

" Show search matches as I type my pattern
set incsearch

" Don't join lines with two spaces at the end of sentences
set nojoinspaces

" Don't show a statusline if there's only one window
" This is the Vim default, but NeoVim changed it
if &laststatus != 1
  set laststatus=1
endif

" Don't redraw the screen during batch execution
set lazyredraw

" Break lines at word boundaries
set linebreak

" Define extra 'list' display characters
set listchars+=extends:>       " Unwrapped text to screen right
set listchars+=precedes:<      " Unwrapped text to screen left
set listchars+=tab:>-          " Tab characters, preserve width
set listchars+=trail:_         " Trailing spaces
silent! set listchars+=nbsp:+  " Non-breaking spaces

" Don't allow setting options via buffer content
set nomodeline

" Treat numbers with a leading zero as decimal, not octal
set nrformats-=octal

" Options for file search with gf/:find
set path-=/usr/include  " Let the C/C++ filetypes set that
set path+=**            " Search current directory's whole tree

" Disable command line display of file position
" This is the Vim default, but NeoVim changed it
if &ruler
  set noruler
endif

" Make sessions usable
if exists('+sessionoptions')
  set sessionoptions-=localoptions  " No buffer options or mappings
  set sessionoptions-=options       " No global options or mappings
endif

" Don't show startup splash screen (I donated)
set shortmess+=I

" Prefix wrapped rows with three dots
set showbreak=…

" New windows go below or to the right of a split
set splitbelow
set splitright

" Give me a bit longer to complete mappings
set timeoutlen=3000

" No terminal mouse, even if we could
silent! set ttymouse=

" Keep undo files, hopefully in a dedicated directory
if has('persistent_undo')
  set undofile
  set undodir^=~/.cache/undo//
endif

" Wildmenu settings; see also plugin/wildignore.vim
set wildmenu                " Use wildmenu
set wildmode=list:longest   " Tab press completes and lists
silent! set wildignorecase  " Case insensitive, if supported

" Let me move beyond buffer text in visual block mode
if exists('+virtualedit')
  set virtualedit+=block
endif

" Please don't beep at me
set noerrorbells

" Always show line numbers
set number

" Show the command that I am typing
set showcmd

" Airline tells me which mode I'm in
set noshowmode

" The mouse works, let's use it
set mouse=a

" Highlight matching parens and brackets
set showmatch

" Don't wrap searches around
set nowrapscan

" THIS STUFF NEEDS A NEW HOME
let g:airline_powerline_fonts = 1

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('nvim-0.3.2') || has('patch-8.1.0360')
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif
" Just go out in insert mode
imap jk <ESC>l

nnoremap <F5> :make<CR>

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
"
" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
''
