
call plug#begin('~/.config/nvim/plugged')

Plug 'rcarriga/nvim-notify'
Plug 'karb94/neoscroll.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'mortepau/codicons.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'rmagatti/goto-preview'

" TODO: Install https://git.sr.ht/~whynothugo/lsp_lines.nvim

" Cht.sh
Plug 'RishabhRD/popfix'
Plug 'pedronasser/nvim-cheat.sh'

Plug 'folke/which-key.nvim'
Plug 'kdheepak/lazygit.nvim'

" Toggle comments
"Plug 'preservim/nerdcommenter'
Plug 'numToStr/Comment.nvim'

" Collection of common configurations for the Nvim LSP client
"Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" LSP Signature tooltip
"Plug 'ray-x/lsp_signature.nvim'

" Shows lsp status
Plug 'j-hui/fidget.nvim'

" Format text
Plug 'sbdchd/neoformat'

""Javascript/typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'LinArcX/telescope-command-palette.nvim'

Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'branch': 'release/0.x'
    \ }

"" Code completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hood/popui.nvim'

" Adds extra functionality over rust analyzer
"Plug 'simrat39/rust-tools.nvim'

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
"Plug 'romgrk/barbar.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

Plug 'itchyny/lightline.vim'
"Plug 'feline-nvim/feline.nvim'

" File lookup
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" OneDark theme
"Plug 'joshdick/onedark.vim' Old plugin
Plug 'navarasu/onedark.nvim'

" Auto close brackets
Plug 'windwp/nvim-autopairs'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Custom Snippets
Plug 'sirver/UltiSnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" initialize plugin system
call plug#end()
