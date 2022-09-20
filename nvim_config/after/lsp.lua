local keymap = require("nvim_config.keymap")
local bufnr = vim.api.nvim_get_current_buf()

keymap(function(nmap, vmap, imap, map, xmap)
  map("<C-f>", function() vim.lsp.buf.format({ async = true }) end)
  map("<Space>f", function() vim.lsp.buf.format({ async = true }) end)
  imap("<C-f>", function() vim.lsp.buf.format({ async = true }) end)

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  nmap('<space>e', vim.diagnostic.open_float, opts)
  nmap('[d', vim.diagnostic.goto_prev, opts)
  nmap(']d', vim.diagnostic.goto_next, opts)
  nmap('<space>q', vim.diagnostic.setloclist, opts)

  local bufopts = { noremap = true, silent = true }
  nmap('<space>t', vim.lsp.buf.declaration, bufopts)
  nmap('<space>d', vim.lsp.buf.definition, bufopts)
  nmap('<space>l', vim.lsp.buf.hover, bufopts)
  nmap('<space>i', vim.lsp.buf.implementation, bufopts)
  nmap('<space>s', vim.lsp.buf.signature_help, bufopts)
  --nmap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  ----nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  ----nmap('<space>wl', function()
  ----  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  ----end, bufopts)
  ----nmap('<space>D', vim.lsp.buf.type_definition, bufopts)
  --nmap('<space>r', vim.lsp.buf.rename, bufopts)
  --nmap('<space>a', vim.lsp.buf.code_action, bufopts)
  --nmap('<space>r', vim.lsp.buf.references, bufopts)
  ----nmap('<C-f>', vim.lsp.buf.formatting, bufopts)
end)

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
        disable = { "unused-local", "unused-function", "redefined-local" }
      }
    }
  }
}
lspconfig['rust_analyzer'].setup {
  capabilities = capabilities
}
lspconfig['tsserver'].setup {
  capabilities = capabilities
}





-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_on_attach = function(client, bufnr)
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
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig.tsserver.setup {}
lspconfig.gopls.setup {}
lspconfig.vimls.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
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


require("null-ls").setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <C-f> :lua vim.lsp.buf.formatting()<CR>")

      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <C-f> :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

require("prettier").setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})


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
--
