vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'ron-rs/ron.vim' }
  use { 'rcarriga/nvim-notify' }
  use { 'karb94/neoscroll.nvim' }
  use { 'glepnir/dashboard-nvim' }
  use { 'mortepau/codicons.nvim' }
  use { 'onsails/lspkind.nvim' }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }
  --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'nvim-treesitter/playground', requires = "nvim-treesitter/nvim-treesitter" }
  use { 'rust-lang/rust.vim' }

  use { 'kdheepak/lazygit.nvim' }

  -- Toggle comments
  --use {'preservim/nerdcommenter'}
  use { 'numToStr/Comment.nvim' }

  -- Collection of common configurations for the Nvim LSP client
  --use {'williamboman/nvim-lsp-installer'}
  use { 'neovim/nvim-lspconfig' }

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }

  -- Shows lsp status
  use { 'j-hui/fidget.nvim' }

  ----Javascript/typescript
  use { 'leafgarland/typescript-vim' }
  use { 'peitalin/vim-jsx-typescript' }
  use { 'mxw/vim-jsx' }

  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'LinArcX/telescope-command-palette.nvim' }

  use { 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } }


  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'MunifTanjim/prettier.nvim' }

  ---- Code completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  --use {'hrsh7th/cmp-vsnip'}
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hood/popui.nvim' }

  -- Snippet engine
  use { 'hrsh7th/vim-vsnip' }

  -- Show warnings and errors on the bottom
  use { 'folke/trouble.nvim' }

  -- File manager
  use { 'kyazdani42/nvim-tree.lua' }

  use { 'kyazdani42/nvim-web-devicons' }
  use { 'tiagofumo/vim-nerdtree-syntax-highlight' }

  -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- Debugging
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use { 'tanvirtin/monokai.nvim' }

  -- Auto close brackets
  use { 'windwp/nvim-autopairs' }

  -- Indent lines
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Custom Snippets
  use { 'sirver/UltiSnips' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }

end)

local g = vim.api.nvim_create_augroup("PackerCompile", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = g,
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})


