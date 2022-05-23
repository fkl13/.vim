" load plugins

set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/sonokai'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" fuzzy finder
Plug 'airblade/vim-rooter'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

"Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'

if has('nvim')
  " lsp plugns
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'

  " needed for nvim-cmp
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " GUI enhancements
  Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'onsails/lspkind.nvim'
  Plug 'folke/trouble.nvim'

  " git decorations
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  Plug 'windwp/nvim-autopairs'
endif

call plug#end()


filetype plugin indent on   " required

"
" General settings
"
set backspace=indent,eol,start
set ruler                       " Show the cursor position all the time 
set number                      " Show line number
set showcmd                     " Show command in bottom bar
set noshowmode                  " We show the mode with airline or lightline
set noerrorbells                " No beeps
set cursorline                  " highlight current line
set lazyredraw                  " Wait to redraw
set laststatus=2

set encoding=utf-8              " Set default encoding to UTF-8

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set hidden                      " have more than one unsaved buffer

set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

set lazyredraw                  " Wait to redraw


" Handle long lines nicely
set wrap
set textwidth=79
set formatoptions=qrn1

set wildmenu                    " visual autocomplete for command menu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn   " Version control

if has('mouse')
  set mouse=a
endif

set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab

syntax on                       " enable syntax processing
"set background=dark             " Setting dark mode
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

" sonokai
if has('termguicolors')
  set termguicolors
endif
let g:sonokai_enable_italic = 1
let g:sonokai_style = 'default'
colorscheme sonokai


" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menu,menuone,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" spell check
set spelllang=en
" Show 9 suggestions
set spellsuggest=best,9

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" spell check for git commits
autocmd FileType gitcommit setlocal spell

"
" Key bindings
"

" extra key combination
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Remove search highlight
vnoremap <leader>l :nohlsearch<cr>
nnoremap <leader>l :nohlsearch<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Buffer prev/next
nnoremap <leader><right> :bnext<CR>
nnoremap <leader><left> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Leave insert mode
imap jk <ESC>l


"
" Plugin configs
"

" nvim-tree.lua
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_add_trailing = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1

if has('nvim')
lua <<EOF
  require'nvim-tree'.setup {
    filters = {
      dotfiles = true,
      custom = {
        '.git'
      },
    },
    git = {
      ignore = true
    }
  }
EOF
endif


" FZF
" todo replace with telescope
let g:fzf_buffers_jump = 1

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>


" bufferline
if has('nvim')
set termguicolors
lua << EOF
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{filetype = "NvimTree", text = "File Explorer"}},
  }
}
EOF
endif

" indent-blankline
if has('nivm')
lua <<EOF
require("indent_blankline").setup {
  char = "|",
  buftype_exclude = {"terminal"},
  show_end_of_line = false,
}
EOF
endif

" lualine
if has('nvim')
lua << EDF
require('lualine').setup{
  options = {
    section_separators = '',
    component_separators = ''
  }
}
EDF
endif

" nvim-web-devicon
if has('nvim')
lua << EOF
require'nvim-web-devicons'.setup{
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require'nvim-web-devicons'.set_icon{
  vimrc = {
    icon = "",
    color = "#019833",
    name = "Vimrc"
  },
  Makefile = {
    icon = "",
    color = "#6d8086",
    name = "Makefile",
  }
}
EOF
endif

" gitsigns.nvim
if has('nvim')
lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '_‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~_', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF
endif


" Fugitive
nnoremap <leader>gs :Git status<CR>
"nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>


" Markdown
" disable folding
let g:vim_markdown_folding_disabled = 1

" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" vim-go
"let g:go_fmt_command = 'goimports'
"let g:go_fmt_autosave = 1
"
""let g:go_term_enabled = 1
"
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <leader>t  <Plug>(go-test)


" LSP
if has('nvim')

if executable('gopls')
lua <<EOF
  require('lspconfig').gopls.setup {
    cmd = {'gopls', 'serve'},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }

 -- vim.api.nvim_create_autocmd("BufWritePre", {
   -- pattern = { "*.go" },
    --callback = vim.lsp.buf.format,
  --})
EOF
else
  echo "gopls executable is missing: https://github.com/golang/tools/tree/master/gopls"
endif

" nvim-cmp (autocompletion)
lua << EOF
  -- Add additional capabilities supported by nvim-cmp
  local lspconfig = require'lspconfig'
  local lspkind = require('lspkind')
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- Enable LSP snippets
      -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.abort(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },
    -- Installed sources
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
    experimental = {
      ghost_text = true,
    },
    formatting = {
      format = lspkind.cmp_format {
        mode = 'symbol_text',
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          path = "[path]",
          luasnip = "[snip]",
          gh_issues = "[issues]",
        },
      }
    }
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { 'gopls' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities
    }
  end

EOF
endif

" nvim-autopairs
if has('nvim')
lua <<EOF
  require('nvim-autopairs').setup{}

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
EOF
endif

" trouble.nvim
if has('nvim')
lua <<EOF
  require("trouble").setup{}

  vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    {silent = true, noremap = true}
  )
  vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    {silent = true, noremap = true}
  )
  -- maybe change keymap?
  vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
    {silent = true, noremap = true}
  )
EOF
endif

" vim:ts=2:sw=2:et
