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
