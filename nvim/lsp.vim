lua << EOF
local lspconfig = require('lspconfig')

--nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
--nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
--nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
--nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- " Only set if you have telescope installed
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', '<space>t', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', '<space>d', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', '<space>l', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<space>i', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<space>s', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wl', function()
--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--end, bufopts)
--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<space>r', vim.lsp.buf.references, bufopts)
--vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig.tsserver.setup{}
lspconfig.gopls.setup{}
lspconfig.vimls.setup{}
lspconfig.rust_analyzer.setup{
  settings = {
    ["rust-analyzer"] = {
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
      }
    }
  },
  flags = lsp_flags,
  on_attach = lsp_on_attach,
}
--vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
--vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

vim.diagnostic.config({
  underline = false,
  update_in_insert = false,
  --virtual_text = {
  --  prefix = '●', -- Could be '●', '▎', 'x'
  --  spacing = 2,
  --  severity = vim.diagnostic.severity.ERROR
  --},
  virtual_text = false,
  float = true
})

local M = {}

M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

M.setup()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--vim.o.updatetime = 250
--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
EOF
