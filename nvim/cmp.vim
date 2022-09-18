lua << EOF
local cmp = require'cmp'
local lspkind = require('lspkind')

local function border(hl_name)
  return {
    "╭",
    "─",
    "╮",
    "│",
    "╯",
    "─",
    "╰",
    "│",
  }
end

lspkind.init({ preset = 'codicons' })

cmp.setup({
  view = {
    entries = "custom"
  },

  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  window = {
    completion = {
      border = border(),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border(),
    },
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
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'ultisnips' },
  	{ name = "path" },
    { name = 'vsnip' },
  }, {
		{ name = "buffer", keyword_length = 3 },
	}),
})

--cmp.setup.cmdline('/', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

EOF

highlight! CmpBorder guibg=NONE guifg=#ff0000

" highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" " blue
" highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
" highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" " light blue
" highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
" highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
" highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" " pink
" highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
" highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" " front
" highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
" highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
" highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
