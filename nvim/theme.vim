lua << EOF
local monokai = require('monokai')
local palette = monokai.pro

monokai.setup {
    palette = palette,
    custom_hlgroups = {
      DiagnosticError = { fg = palette.red },
      DiagnosticFloatError = { fg = palette.red },
      NormalFloat = { bg = palette.base2 }
    },
    --italics = false
}
EOF
