local mytrouble = vim.api.nvim_create_augroup("my_trouble", { clear = true })

local function handle_trouble()
  vim.cmd("silent! TroubleRefresh")
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = "my_trouble",
  pattern = "*",
  callback = handle_trouble
})

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
