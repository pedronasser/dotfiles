""""""""""""""""""""""""""""""
" NEOVIM SETTINGS
""""""""""""""""""""""""""""""
source ~/dotfiles/nvim/settings.vim

""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:clap_disable_run_rooter = v:true

let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'javascript': v:true,
      \ 'typescript': v:true,
      \ 'typescriptreact': v:true,
      \ 'javascriptreact': v:true,
      \ 'jsx': v:true,
      \ 'tsx': v:true,
      \ 'lua': v:true,
      \ 'go': v:true,
      \ 'rs': v:true,
      \ }

let g:copilot_no_tab_map = v:true

let g:VM_mouse_mappings = 1

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<M-C-Down>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<M-C-Up>'
let g:neoformat_enabled_yaml = ['prettierd']

let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_char = '│'
let g:indent_blankline_char_blankline = ' '

source ~/dotfiles/nvim/plugin.vim
source ~/dotfiles/nvim/telescope.vim
source ~/dotfiles/nvim/lsp.vim
source ~/dotfiles/nvim/treesitter.vim

lua << EOF

local db = require('dashboard')
db.custom_header = vim.g.dashboard_custom_header

db.custom_center = {
  {
    icon = '  ',
    desc = 'New file                                ',
    action ='DashboardNewFile'
  },
  {
    icon = '  ',
    desc = 'Recently latest session                 ',
    action ='SessionLoad'
  },
  {
    icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'DashboardFindHistory',
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
  },
  {
    icon = '  ',
    desc ='File Browser                            ',
    action =  'Telescope file_browser',
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
  },
}

local codicons = require('codicons')
codicons.setup{}

require('Comment').setup({
  toggler = {
    ---Line-comment toggle keymap
    line = 'cl',
    ---Block-comment toggle keymap
    block = 'cb',
  },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
  opleader = {
    ---Line-comment keymap
    line = 'cl',
    ---Block-comment keymap
    block = 'cb',
  }
})

--require('feline').setup()
require('notify').setup{
  render = "minimal",
  minimum_width = 40,
  level = 1
}
require('neoscroll').setup{}
require("fidget").setup{} -- TODO: improve this configuration
--require("lsp_signature").setup({
--  bind = true, -- This is mandatory, otherwise border config won't get registered.
--  handler_opts = {
--    border = "rounded"
--  }
--}) -- TODO: improve this configuration
require("nvim-tree").setup({
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    hide_root_folder = false,
    adaptive_size = false,
    signcolumn = "yes",
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  git = {
    ignore = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    group_empty = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
      git_placement = "after"
    }
  },
  update_focused_file = {
    enable = true
  },
  diagnostics = {
    enable = true
  }
})

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#343537 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars = { space = ' ', tab = '  ' }

--IndentBlanklineContextChar
require("indent_blankline").setup {
-- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = false,
  show_end_of_line = false,
  space_char_blankline = " ",
}

require("nvim-autopairs").setup {}

require'bufferline'.setup {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

local cmp = require'cmp'
local lspkind = require('lspkind')

lspkind.init({ preset = 'codicons' })

cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  formatting = {
    fields = { "kind", "abbr" },
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    }),
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
  -- Add tab support
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Up>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'ultisnips' },
    { name = 'vsnip' },
  	{ name = "path" },
  }, {
		{ name = "buffer", keyword_length = 3 },
	}),
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}

require("trouble").setup {
  position = "bottom",
  mode = "document_diagnostics",
  auto_open = false,
  auto_close = false,
  auto_preview = false,
  group = false,
  padding = false,
  indent_lines = true,
  height = 7,
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}


EOF

highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
" Show diagnostic popup on cursor hover
"autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

let g:lightline = {
\ 'colorscheme': 'onedark',
  \ }

function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

"au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "Trouble" | set laststatus=0 | else | set laststatus=2 | endif

set laststatus=2
set statusline=%t " tail of the filename
set statusline+=%m " modified flag
set statusline+=\ [%{strlen(&fenc)?&fenc.',':''} " file encoding
set statusline+=%{&ff}] " file format
set statusline+=\ %y " filetype
set statusline+=\ %r " read only flag
set statusline+=%= " left/right separator
set statusline+=%c " cursor column
set statusline+=\ %l/%L " cursor line/total lines
set statusline+=\ %p%% " percent through file
set foldcolumn=1
if 0
  set foldcolumn=0
  set statusline= laststatus=0 ruler
  set rulerformat=%l,%c
  set rulerformat+=\ %m
  set rulerformat+=%=
  set rulerformat+=%p%%
end

"autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
"autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * silent! undojoin | silent! Neoformat
" augroup END

highlight CopilotSuggestion guifg=#555555 ctermfg=8

""""""""""""""""""""""""""""""
" SET THEME
""""""""""""""""""""""""""""""
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
"if (has("autocmd")) 
  "augroup colorextend 
      "autocmd! 
      "autocmd ColorScheme * call onedark#extend_highlight("Statement", { "gui": "italic" }) 
      "autocmd ColorScheme * call onedark#extend_highlight("Comment", { "gui": "italic" }) 
      "autocmd ColorScheme * call onedark#extend_highlight("Keyword", { "gui": "italic" }) 
      "autocmd ColorScheme * call onedark#extend_highlight("jsFunction", { "gui": "italic" })
      "autocmd ColorScheme * call onedark#extend_highlight("jsImport", { "gui": "italic" })
      "autocmd ColorScheme * call onedark#extend_highlight("jsExport", { "gui": "italic" })
      "autocmd ColorScheme * call onedark#extend_highlight("jsFrom", { "gui": "italic" })
      "autocmd ColorScheme * call onedark#extend_highlight("Type", { "gui": "italic" })
  "augroup END 
"endif

lua << EOF

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.state'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.state'.set_offset(0)
    end
  end
})

require('onedark').setup  {
    -- Main options --
  style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    --toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    --toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'italic',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },
    -- Custom Highlights --
    colors = {
      dark_grey = "#45464a",
      bgcolumn = "#262931",
    }, -- Override default colors
    highlights = {
      NvimTreeVertSplit = {fg = "$bgcolumn", bg = "$bgcolumn"},
      Whitespace = { fg = "$dark_grey" },
      SignColumn = { bg = "$bgcolumn" },
      FoldColumn = { bg = "$bgcolumn" },
      ColorColumn = { bg = "$bgcolumn" },
      CursorColumn = { bg = "$bgcolumn" },
      LineNr = { bg = "$bgcolumn" }
    }, -- Override highlight groups
    -- Plugins Config --
    diagnostics = {
      darker = false, -- darker colors for diagnostic
      undercurl = true,   -- use undercurl instead of underline for diagnostics
      background = true,    -- use background color for virtual text
    },
}

require('onedark').load()
EOF

""""""""""""""""""""""""""""""
" AUTOCMDS
""""""""""""""""""""""""""""""

autocmd BufEnter * stopinsert

"autocmd BufEnter * lua require'trouble'.refresh() end
lua << EOF
local mytrouble = vim.api.nvim_create_augroup("my_trouble", { clear = true })
local t = require('trouble')

function handle_trouble()
  vim.cmd("silent! TroubleRefresh") 
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = "my_trouble",
  pattern = "*",
  callback = handle_trouble
})

EOF

augroup kitty_mp
    autocmd!
    autocmd VimLeave * :silent !kitty @ --to $KITTY_LISTEN_ON set-spacing --match-tab window_id:$KITTY_WINDOW_ID padding=5 margin=0
    autocmd VimLeave * :silent !kitty @ --to $KITTY_LISTEN_ON set-tab-title --match window_id:$KITTY_WINDOW_ID
    autocmd VimEnter * :silent !kitty @ --to $KITTY_LISTEN_ON set-spacing --match-tab window_id:$KITTY_WINDOW_ID padding=0 margin=0
    autocmd VimEnter * :silent !kitty @ --to $KITTY_LISTEN_ON set-tab-title --match window_id:$KITTY_WINDOW_ID NVIM
augroup END

""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""
source ~/dotfiles/nvim/keybindings.vim
