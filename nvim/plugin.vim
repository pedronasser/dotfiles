lua << EOF
--[[ vim.cmd [[packadd nvim-treesitter]]
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'RRethy/nvim-base16'}

  use {'ron-rs/ron.vim'}
  use {'rcarriga/nvim-notify'}
  use {'karb94/neoscroll.nvim'}
  use {'glepnir/dashboard-nvim'}
  use {'mortepau/codicons.nvim'}
  use {'onsails/lspkind.nvim'}

  -- TODO: Install https://git.sr.ht/~whynothugo/lsp_lines.nvim
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }

  use {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'}
  --use {'nvim-treesitter/nvim-treesitter-context', disable = true}
  -- use {'nvim-treesitter/playground', disabled = true}
  use {'rust-lang/rust.vim'}

  -- Cht.sh
  use {'RishabhRD/popfix'}
  use {'pedronasser/nvim-cheat.sh'}

  use {'folke/which-key.nvim'}
  use {'kdheepak/lazygit.nvim'}

  -- Toggle comments
  --use {'preservim/nerdcommenter'}
  use {'numToStr/Comment.nvim'}

  -- Collection of common configurations for the Nvim LSP client
  --use {'williamboman/nvim-lsp-installer'}
  use {'neovim/nvim-lspconfig'}

  -- LSP Signature tooltip
  --use {'ray-x/lsp_signature.nvim'}

  -- Shows lsp status
  use {'j-hui/fidget.nvim'}

  -- Format text
  use {'sbdchd/neoformat'}

  ----Javascript/typescript
  use {'leafgarland/typescript-vim'}
  use {'peitalin/vim-jsx-typescript'}
  use {'mxw/vim-jsx'}

  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-ui-select.nvim'}
  use {'LinArcX/telescope-command-palette.nvim'}

  -- use {'prettier/vim-prettier', {}
  --     \ 'do': 'yarn install --frozen-lockfile --production',
  --     \ 'branch': 'release/0.x'
  --     \ }

  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'MunifTanjim/prettier.nvim'}

  ---- Code completion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lsp-signature-help'}
  --use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-buffer'}
  use {'hood/popui.nvim'}

  -- Adds extra functionality over rust analyzer
  --use {'simrat39/rust-tools.nvim'}

  -- Snippet engine
  use {'hrsh7th/vim-vsnip'}


  -- Show warnings and errors on the bottom
  use {'folke/trouble.nvim'}

  -- Github copilot
  use {'github/copilot.vim'}

  -- File manager
  --use {'ms-jpq/chadtree', branch = 'chad', 'do': 'python3 -m chadtree deps'}
  use {'kyazdani42/nvim-tree.lua'}

  use {'kyazdani42/nvim-web-devicons'}
  use {'romgrk/barbar.nvim'}
  use {'tiagofumo/vim-nerdtree-syntax-highlight'}

  -- Debugging
  use {'mfussenegger/nvim-dap'}

  use {'nvim-lualine/lualine.nvim'}
  -- use {'itchyny/lightline.vim'}
  --use {'feline-nvim/feline.nvim'}

  -- File lookup
  use {'mg979/vim-visual-multi', branch = 'master'}

  -- OneDark theme
  -- use {'navarasu/onedark.nvim'}
  -- use {'sainnhe/sonokai'}
  use {'tanvirtin/monokai.nvim'}

  -- Auto close brackets
  use {'windwp/nvim-autopairs'}

  -- Indent lines
  use {'lukas-reineke/indent-blankline.nvim'}

  -- Custom Snippets
  use {'sirver/UltiSnips'}
  use {'quangnguyen30192/cmp-nvim-ultisnips'}

end)

EOF
