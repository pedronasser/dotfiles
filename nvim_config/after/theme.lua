local monokai = require('monokai')
local palette = monokai.pro

monokai.setup {
  palette = palette,
  custom_hlgroups = {
    DiagnosticError = { fg = palette.red },
    DiagnosticFloatingError = { fg = palette.red },
    NormalFloat = { bg = palette.base1 },
    Float = { bg = palette.base1 },
  },
  --italics = false
}

vim.cmd [[
  highlight IndentBlanklineSpaceChar guifg=#343537 gui=nocombine

  syntax on
  colorscheme monokai_pro
]]
