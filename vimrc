" load plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible

filetype plugin indent on   " required

"
" General settings
"
set backspace=indent,eol,start
set ruler                       " Show the cursor position all the time
set number                      " Show line number
set showcmd                     " Show command in bottom bar
set showmode                    " Show current mode
set noerrorbells                " No beeps

set encoding=utf-8              " Set default encoding to UTF-8

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set hidden

set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches

if has('mouse')
    set mouse=a
endif

set wildmenu                    " visual autocomplete for command menu
set cursorline                  " highlight current line

syntax on                       " enable syntax processing
set background=dark             " Setting dark mode
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
