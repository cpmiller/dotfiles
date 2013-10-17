set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

set stal=2
set bs=2
set bsdir=buffer
set ul=100
set ff=unix
set fs
set smartindent
set expandtab
" Show cursor position
set ruler
" Show the current mode
set showmode

set shiftwidth=4

"PHP Settings
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1

setlocal omnifunc=syntaxcomplete#Complete
set cot+=menuone
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"Set color scheme
set t_Co=256
colorscheme zenburn 
syntax enable

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	autocmd FileType text setlocal textwidth=78
	
endif
