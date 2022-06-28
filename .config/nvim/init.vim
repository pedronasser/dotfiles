set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allows auto-indenting depending on file t
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set clipboard=unnamedplus
set cursorline
set mouse=a
set noshowmode
autocmd BufRead,BufNewFile * set signcolumn=yes
autocmd FileType tagbar,nerdtree set signcolumn=no
set foldmethod=indent
set nofoldenable
set encoding=UTF-8
set splitbelow splitright

" correct colors
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if has('macunix') || system('uname -o') =~? '^darwin'
  set t_ZH=^[[3m t_ZR=^[[23m " Set the italics codei
endif

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Autocompletion framework
"Plug 'hrsh7th/nvim-cmp'
" cmp LSP completion
"Plug 'hrsh7th/cmp-nvim-lsp'
" cmp Snippet completion
"Plug 'hrsh7th/cmp-vsnip'
" cmp Path completion
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-buffer'
" See hrsh7th other plugins for more great completion sources!
"
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'hood/popui.nvim'

" Adds extra functionality over rust analyzer
Plug 'simrat39/rust-tools.nvim'

" Sticky header
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Github copilot
Plug 'github/copilot.vim'

" File manager
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File lookup
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" initialize plugin system
call plug#end()

let g:nord_italic = v:true
let g:nord_italic_comments = v:true
let g:nord_contrast = v:true

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight Keyword ctermfg=4 guifg=#81A1C1 gui=italic cterm=italic
  autocmd ColorScheme nord highlight Structure ctermfg=4 guifg=#81A1C1 gui=italic cterm=italic
augroup END

"if (has('termguicolors'))
"  set termguicolors
"endif

colorscheme nord

set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c

" Hotkey to open the file explorer
nnoremap <C-B> :CHADopen<cr>
nnoremap <C-O> :CHADopen<cr>
nnoremap <C-L> :call setqflist([])<cr>

" Move to previous/next
nnoremap <silent>    <ESC>, :BufferPrevious<CR>
nnoremap <silent>    <ESC>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <slent>    <ESC>< :BufferMovePrevious<CR>
nnoremap <silent>    <ESC>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <ESC>1 :BufferGoto 1<CR>
nnoremap <silent>    <ESC>2 :BufferGoto 2<CR>
nnoremap <silent>    <ESC>3 :BufferGoto 3<CR>
nnoremap <silent>    <ESC>4 :BufferGoto 4<CR>
nnoremap <silent>    <ESC>5 :BufferGoto 5<CR>
nnoremap <silent>    <ESC>6 :BufferGoto 6<CR>
nnoremap <silent>    <ESC>7 :BufferGoto 7<CR>
nnoremap <silent>    <ESC>8 :BufferGoto 8<CR>
nnoremap <silent>    <ESC>9 :BufferGoto 9<CR>
nnoremap <silent>    <ESC>0 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <ESC>p :BufferPin<CR>
" Close buffer
nnoremap <silent>    <ESC>c :BufferClose<CR>

nnoremap <silent>   <C-p> :Clap files!<CR>
nnoremap <silent>   <S-Tab> :Clap buffers<CR>
nnoremap <silent>   <ESC>p :Clap command<CR>

nnoremap <Tab> <C-w>w
nnoremap <C-D> <C-w>s
nnoremap <ESC>d <C-w>j
nnoremap <ESC>q <C-w>q

" Keybindings to move lines
" 
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>

" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
   -- server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
---        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            --["rust-analyzer"] = {
                -- enable clippy on save
                --checkOnSave = {
                  --  command = "clippy"
                --},
       --     }
     --   }
   -- },
}

require('rust-tools').setup(opts)
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Quick-fix
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
"lua <<EOF
"local cmp = require'cmp'
"cmp.setup({
"  snippet = {
"    expand = function(args)
"        vim.fn["vsnip#anonymous"](args.body)
"    end,
"  },
"  mapping = {
"    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
""    ['<C-n>'] = cmp.mapping.select_next_item(),
"    -- Add tab support
"    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
"    ['<Tab>'] = cmp.mapping.select_next_item(),
"    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"    ['<C-f>'] = cmp.mapping.scroll_docs(4),
"    -- ['<C-Space>'] = cmp.mapping.complete(),
"    ['<C-e>'] = cmp.mapping.close(),
"    ['<CR>'] = cmp.mapping.confirm({
"      behavior = cmp.ConfirmBehavior.Insert,
"      select = true,
"    })
"  },
"
"  -- Installed sources
"  sources = {
"    { name = 'nvim_lsp' },
"    { name = 'vsnip' },
"    { name = 'path' },
"    { name = 'buffer' },
"  },
"})
"EOF


" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:chadtree_settings = {
    \ 'theme.text_colour_set': 'nord',
    \ }

let g:clap_disable_run_rooter = v:true
