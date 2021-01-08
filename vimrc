" load plugins

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
set cursorline                  " highlight current line
set lazyredraw                  " Wait to redraw "

set encoding=utf-8              " Set default encoding to UTF-8

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set hidden                      " have more than one unsaved buffer

set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

" Handle long lines nicely
set wrap
set textwidth=79
set formatoptions=qrn1

set wildmenu                    " visual autocomplete for command menu
set wildmode=list:longest,full

if has('mouse')
	set mouse=a
endif

set autoindent

syntax on                       " enable syntax processing
set background=dark             " Setting dark mode
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox


" Key bindings

" extra key combination
let mapleader = ","
let g:mapleader = ","

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Leave insert mode
imap jk <ESC>l


" Plugin configs

" NerdTree
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$']

" Close nerdtree on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'    " determine local working directory
let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" for caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

nmap <C-g> :CtrlPCurWD<cr>
imap <C-g> <esc>:CtrlPCurWD<cr>
