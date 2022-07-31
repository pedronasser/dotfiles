""""""""""""""""""""""""""""""
" NEOVIM SETTINGS
""""""""""""""""""""""""""""""
source ~/dotfiles/nvim/settings.vim

""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""

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

lua << EOF


require"fidget".setup{}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#343537 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars = { space = '⋅', tab = '  ' }

--IndentBlanklineContextChar
require("indent_blankline").setup {
-- for example, context is off by default, use this to turn it on
show_current_context = true,
  show_current_context_start = false,
  show_end_of_line = false,
  space_char_blankline = " ",
}

require("nvim-autopairs").setup {}

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

require("trouble").setup {
  position = "bottom",
  mode = "document_diagnostics",
  auto_open = true,
  group = false,
  padding = false,
  indent_lines = true,
  height = 7,
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}


EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
" Show diagnostic popup on cursor hover
"autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

let g:lightline = {
\ 'colorscheme': 'onedark',
  \ }

"function! LightlineReadonly()
  "return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
"endfunction

"au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "Trouble" | set laststatus=0 | else | set laststatus=2 | endif
set laststatus=200
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
if 0
  set statusline= laststatus=0 ruler
  set rulerformat=%l,%c
  set rulerformat+=\ %m
  set rulerformat+=%=
  set rulerformat+=%p%%
end

"autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
"autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
augroup fmt
  autocmd!
  autocmd BufWritePre * silent! undojoin | silent! Neoformat
augroup END

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
      dark_grey = "#45464a"
    }, -- Override default colors
    highlights = {
      Whitespace = {fg = "$dark_grey" }
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

"autocmd BufEnter * lua require'trouble'.refresh() end
lua << EOF
local mytrouble = vim.api.nvim_create_augroup("my_trouble", { clear = true })
local t = require('trouble')

function handle_trouble()
  t.refresh()
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = "my_trouble",
  pattern = "*",
  callback = handle_trouble,
})
EOF

""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""
source ~/dotfiles/nvim/keybindings.vim
