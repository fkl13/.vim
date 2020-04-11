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
set hidden                      " have more than one unsaved buffer

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


nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


"
" NerdTree
"
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
