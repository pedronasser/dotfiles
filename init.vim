set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
"set wildmode=longest,list   " get bash-like tab completions
syntax enable
filetype plugin indent on   " allows auto-indenting depending on file t
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set clipboard=unnamedplus
set cursorline
set mouse=a
set noshowmode
"autocmd BufRead,BufNewFile * set signcolumn=yes
set signcolumn=yes
set foldmethod=indent
set nofoldenable
set encoding=UTF-8
set splitbelow splitright
set hidden

"""set colorcolumn=80

set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c

" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Toggle comments
Plug 'preservim/nerdcommenter'

" Collection of common configurations for the Nvim LSP client
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'

" Code completion
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
"Plug 'hood/popui.nvim'

" Adds extra functionality over rust analyzer
Plug 'simrat39/rust-tools.nvim'

" Sticky header
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Show warnings and errors on the bottom
Plug 'folke/trouble.nvim'

" Github copilot
Plug 'github/copilot.vim'

" File manager
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

" File lookup
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'joshdick/onedark.vim'

" Javascript stuff
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'


" initialize plugin system
call plug#end()

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


" Hotkey to open the file explorer
nnoremap <C-B> :CHADopen<cr>
nnoremap <C-O> :CHADopen<cr>
nnoremap <C-L> :call setqflist([])<cr>

" Move to previous/next
nnoremap <silent>    <A-Left> :BufferPrevious<CR>
nnoremap <silent>    <A-Right> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-A-Left> :BufferMovePrevious<CR>
nnoremap <silent>    <C-A-Right> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferGoto 9<CR>
nnoremap <silent>    <A-0> :BufferLast<CR>

" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>

nnoremap <silent>   <C-p> :Clap files!<CR>
nnoremap <silent>   <C-S-o> :Clap filer<CR>
nnoremap <silent>   <S-Tab> :Clap buffers<CR>
nnoremap <silent>   <C-S-p> :Clap<CR>
nnoremap <silent>   <C-S-g> :Clap grep<CR>

nnoremap <Tab> <C-w>w
nnoremap <C-S-v> <C-w>j
nnoremap <C-S-h> <C-w>q

" Keybindings to move lines
" 
xnoremap <C-S-Up>     :m-2<CR>gv=gv
xnoremap <C-S-Down>   :m'>+<CR>gv=gv

" move current line up one line
nnoremap <C-S-Up>  :<C-u>m-2<CR>==

" move current line down one line
nnoremap <C-S-Down> :<C-u>m+<CR>==

nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
 
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>

map <C-a> <esc>ggVG<CR>

" Duplicate the current line
nnoremap <A-d> <ESC>Yp

" Delete current line
nnoremap <C-Delete> <ESC>dd

" Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'  

nnoremap <silent> <C-Enter> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <S-Space> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <A-Enter> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Quick-fix
nnoremap <silent> <C-`>    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <C-'>    <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

noremap <C-S>          :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-O>:update<CR>

noremap <C-Q>          :q<CR>
vnoremap <C-Q>         <C-C>:q<CR>
inoremap <C-Q>         <C-O>:q<CR>

nnoremap <C-Z> u
nnoremap <C-S-Z> <C-R>
nnoremap <C-Y> <C-R>

inoremap <C-Z> <C-O>u
inoremap <C-S-Z> <C-O><C-R>
inoremap <C-Y> <C-O><C-R>

"Toggle comments
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv

map <C-A-J> <cmd>TroubleToggle<cr>

" Trigger CoC format 
vmap <C-S-f>  <Plug>(coc-format-selected)
nmap <C-S-f>  <Plug>(coc-format-selected)

" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

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
            show_parameter_hints = true,
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
                    parameterHints = true,
                    typeHints = true,
                }
            }
        }
    }
}
require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
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

"  " disable globally
"let g:airline_disable_statusline = 1

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CHADopen' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

"autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

highlight CopilotSuggestion guifg=#555555 ctermfg=8

imap <silent><script><expr> <C-Insert> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

lua << EOF
vim.diagnostic.config({
    underline = false
})
EOF
