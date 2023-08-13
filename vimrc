" load plugins

set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'

" Colorschemes
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'

Plug 'airblade/vim-rooter'

Plug 'tpope/vim-fugitive'

"Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

if has('nvim')
  " lsp plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'

  " needed for nvim-cmp
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
  Plug 'saadparwaiz1/cmp_luasnip'

  " GUI enhancements
  Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'onsails/lspkind.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

  " git decorations
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  " fuzzy finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'windwp/nvim-autopairs'

  Plug 'folke/which-key.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()


filetype plugin indent on   " required

"
" General settings
"
set backspace=indent,eol,start
set ruler                       " Show the cursor position all the time
set number relativenumber       " Show hybrid line number
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
set textwidth=80
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

" Set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


syntax on                       " enable syntax processing
" sonokai
"if has('termguicolors')
"  set termguicolors
"endif
"let g:sonokai_enable_italic = 1
"let g:sonokai_style = 'default'
"colorscheme sonokai

" gruvbox-material
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'mix'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_statusline_style = 'mix'
colorscheme gruvbox-material

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

" Fix broken syntax highlighting in lua blocks. Install treesitter for lua and vim
autocmd FileType vim lua vim.treesitter.start()

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

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

noremap <C-d> <C-d>zz
noremap <C-u> <C-d>zz

"
" Plugin configs
"

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

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

" nvim-tree.lua
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

if has('nvim')
lua <<EOF
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require'nvim-tree'.setup {
    renderer = {
      add_trailing = true,
      highlight_opened_files = 'icon',
      highlight_git = true
    },
    filters = {
      dotfiles = false,
      custom = {
        '.git$'
      },
    },
    git = {
      ignore = true
    }
  }
EOF
endif


" telescope.nvim
if has('nvim')
  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " Ctrl+p keybindings
  nnoremap <C-p> <cmd>Telescope find_files<CR>
  nnoremap <C-g> <cmd>Telescope live_grep<CR>
  "nnoremap <C-b> <cmd>Telescope buffers<CR>

  if !executable('rg')
    echo "You might want to install ripgrep: https://github.com/BurntSushi/ripgrep#installation"
  endif

lua << EOF
  local telescope = require'telescope'
  telescope.setup{
    defaults = {
      file_ignore_patterns = {
        '^.git/',
        '.DS_Store',
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          find_command = {'rg', '--ignore', '--hidden', '--files'},
        },
      },
      extensions = {}
    }
  }

  telescope.load_extension 'fzf'
EOF
endif


" bufferline
if has('nvim')
set termguicolors
lua << EOF
require"bufferline".setup{
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
require"indent_blankline".setup {
  char = "|",
  buftype_exclude = {"terminal"},
  show_end_of_line = false,
}
EOF
endif

" lualine
if has('nvim')
lua << EDF
require'lualine'.setup{
  options = {
    section_separators = '',
    component_separators = '',
    theme = 'gruvbox-material'
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
    icon = '',
    color = '#019833',
    name = 'Vimrc'
  },
  Makefile = {
    icon = '',
    color = '#6d8086',
    name = 'Makefile',
  }
}
EOF
endif

" gitsigns.nvim
if has('nvim')
lua <<EOF
require'gitsigns'.setup{
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '_‾' },
    changedelete = { text = '~_' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
  end
}
EOF
endif


" LSP
if has('nvim')

if executable('gopls')
lua <<EOF
  local lspconfig = require "lspconfig"
  local util = require "lspconfig/util"
  lspconfig.gopls.setup {
    cmd = {'gopls', 'serve'},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
      vim.lsp.buf.formatting_sync(nil, 1000)
    end,
  })

  function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
EOF

autocmd BufWritePre *.go lua go_org_imports()

else
  echo "gopls executable is missing: https://github.com/golang/tools/tree/master/gopls"
endif


if executable('rust-analyzer')
lua <<EOF
  local lspconfig = require'lspconfig'

  lspconfig.rust_analyzer.setup({
    -- cmd = {
      -- "rustup", "run", "stable", "rust-analyzer",
    -- },
    settings = {
      -- config from: https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy diagnostics on save
        checkOnSave = {
          command = "clippy"
        },
      }
    }
  })
EOF
else
  echo "You might want to install rust-analyzer: https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary"
endif

" nvim-cmp (autocompletion)
lua << EOF
  -- Add additional capabilities supported by nvim-cmp
  local lspconfig = require('lspconfig')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')
  local cmp = require('cmp')
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
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
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


  cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    --- In lsp attach function
    local map = vim.api.nvim_buf_set_keymap

  end

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { 'gopls', 'rust_analyzer' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
EOF
endif


" nvim-autopairs
if has('nvim')
lua <<EOF
  require('nvim-autopairs').setup{
    check_ts = true,
  }

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
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


" lspsaga
if has('nvim')

lua <<EOF
  local keymap = vim.keymap.set
  local lspsaga = require 'lspsaga'

  -- Lsp finder find the symbol definition implement reference
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

  -- Code action
  keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

  -- Rename
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

  -- Hover Doc
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

  -- Outline
  keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })
EOF
endif


" which-key.nvim
if has('nvim')
lua << EOF
  local wk = require"which-key"
  wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "→", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
  }
  wk.register({
    f = {
      name = "file",
      f = {"<cmd>Telescope find_files<cr>", "Find file"},
      g = {"<cmd>Telescope live_grep<cr>", "Grep"},
      b = {"<cmd>Telescope buffers<cr>", "Buffers"},
      h = {"<cmd>Telescope help_tags<cr>", "Help tags"},
    },
  }, {prefix = "<leader>"})
EOF
endif

" vim:ts=2:sw=2:et
