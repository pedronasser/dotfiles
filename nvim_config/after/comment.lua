require('Comment').setup({
  toggler = {
    ---Line-comment toggle keymap
    line = 'cl',
    ---Block-comment toggle keymap
    block = 'cb',
  },
  --
  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---Line-comment keymap
    line = 'cl',
    ---Block-comment keymap
    block = 'cb',
  }
})
