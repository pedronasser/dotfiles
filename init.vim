set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
syntax enable
filetype plugin indent on   " allows auto-indenting depending on file t
set tabstop=2               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set clipboard=unnamedplus
set cursorline
set mouse=a
set noshowmode
set foldmethod=indent
set nofoldenable
set encoding=UTF-8
set langmap=§k
set splitbelow splitright
set hidden
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c
set scroll=1
set signcolumn=yes

" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

"Plug 'folke/which-key.nvim'

" Toggle comments
Plug 'preservim/nerdcommenter'

" Collection of common configurations for the Nvim LSP client
"Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" Format text
Plug 'sbdchd/neoformat'

"Javascript/typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'


Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }

" Code completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hood/popui.nvim'

" Adds extra functionality over rust analyzer
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Sticky header
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Show warnings and errors on the bottom
Plug 'folke/trouble.nvim'

" Github copilot
Plug 'github/copilot.vim'

" File manager
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'kyazdani42/nvim-tree.lua'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

Plug 'itchyny/lightline.vim'

" File lookup
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" OneDark theme
Plug 'joshdick/onedark.vim'

" Auto close brackets
Plug 'windwp/nvim-autopairs'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" initialize plugin system
call plug#end()

lua << EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
    space_char_blankline = "⋅",
}
EOF

"lua << EOF
"require("nvim-autopairs").setup {}
"EOF

"lua << EOF
  "require("which-key").setup {
    "-- your configuration comes here
    "-- or leave it empty to use the default settings
    "-- refer to the configuration section below
  "}
"EOF

let g:rustfmt_autosave = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

if (has("autocmd")) 
    augroup colorextend 
        autocmd! 
        autocmd ColorScheme * call onedark#extend_highlight("Statement", { "gui": "italic" }) 
        autocmd ColorScheme * call onedark#extend_highlight("Comment", { "gui": "italic" }) 
        autocmd ColorScheme * call onedark#extend_highlight("Keyword", { "gui": "italic" }) 
        autocmd ColorScheme * call onedark#extend_highlight("jsFunction", { "gui": "italic" })
        autocmd ColorScheme * call onedark#extend_highlight("jsImport", { "gui": "italic" })
        autocmd ColorScheme * call onedark#extend_highlight("jsExport", { "gui": "italic" })
        autocmd ColorScheme * call onedark#extend_highlight("jsFrom", { "gui": "italic" })
        autocmd ColorScheme * call onedark#extend_highlight("Type", { "gui": "italic" })
    augroup END 
endif

colorscheme onedark

" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
--require("nvim-lsp-installer").setup {}

local lspconfig = require('lspconfig')

--lspconfig.tsserver.setup{}
--lspconfig.gopls.setup{}
--lspconfig.vimls.setup{}

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        executor = require("rust-tools/executors").termopen,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            only_current_line = false,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ['rust-analyzer'] = { 
                checkOnSave = {
                    enabled = true,
                    command = "clippy"
                },
                inlayHints = {
                    enable = true,
                    useParameterNames = true,
                    parameterHints = true,
                    typeHints = true,
                },
                assist = {
                  importEnforceGranularity = true,
                  importPrefix = "crate"
                },
                cargo = {
                  allFeatures = true
                },
                checkOnSave = {
                  -- default: `cargo check`
                  command = "clippy"
                },
            },
        },        
    }
}
require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

lua <<EOF
-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
EOF

lua << EOF
require("nvim-tree").setup()
EOF

lua << EOF
  require("trouble").setup {
    position = "bottom",
    mode = "document_diagnostics",
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

let g:airline_theme='onedark'

let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch']

let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1

let g:clap_disable_run_rooter = v:true

let g:lightline = {
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \ },
  \ 'colorscheme': 'onedark',
  \ }

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

set background=dark

set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

"autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
"autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

highlight CopilotSuggestion guifg=#555555 ctermfg=8

imap <silent><script><expr> <C-I> copilot#Accept("\<CR>")

let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'javascript': v:true,
      \ 'typescript': v:true,
      \ 'lua': v:true,
      \ 'go': v:true,
      \ }

let g:copilot_no_tab_map = v:true

lua << EOF
vim.diagnostic.config({
    underline = false
})
EOF

source ~/dotfiles/init/keybindings.vim
