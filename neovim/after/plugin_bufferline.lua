local keymap = require("nvim_config.keymap")
local bufnr = vim.api.nvim_get_current_buf()

keymap(function(nmap, vmap, imap, map, xmap)
end)

-- local monokai = require('monokai')
-- local palette = monokai.pro
--
-- require("bufferline").setup {
--   options = {
--     numbers = "none",
--     buffer_close_icon = '',
--     modified_icon = '●',
--     close_icon = '',
--     left_trunc_marker = '',
--     right_trunc_marker = '',
--
--     offsets = {
--       {
--         filetype = "NvimTree",
--         text_align = "center",
--         separator = true
--       }
--     },
--
--     separator_style = "thin",
--     always_show_bufferline = false,
--   },
--   highlights = {
--     offset_separator = {
--       bg = palette.base2
--     },
--   },
-- }
