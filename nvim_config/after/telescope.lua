-- Telescope keybindings
local keymap = require("nvim_config.keymap")

keymap(function(nmap, vmap, imap, map, xmap)
  map("/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
  map("<C-S-p>", "<cmd>Telescope command_palette<cr>")
  map("<C-p>", "<cmd>Telescope find_files<cr>")
  map("<C-S-s>", "<cmd>Telescope lsp_document_symbols<cr>")
  map("<C-S-f>", "<cmd>Telescope live_grep<cr>")
  map("<C-S-d>", "<cmd>Telescope diagnostics<cr>")
  map("<Space>b", "<cmd>Telescope buffers<cr>")

  imap("<C-S-p>", "<cmd>Telescope command_palette<cr>")
  imap("<C-p>", "<cmd>Telescope find_files<cr>")
  imap("<C-S-s>", "<cmd>Telescope lsp_document_symbols<cr>")
  imap("<C-S-f>", "<cmd>Telescope live_grep<cr>")
  imap("<C-S-d>", "<cmd>Telescope diagnostics<cr>")
  imap("<A-Space>", "<cmd>Telescope buffers<cr>")
end)

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    },
    command_palette = {
      { "File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ':w' },
        { "save all files (C-A-s)", ':wa' },
        { "quit (C-q)", ':qa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
      },
      { "Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      { "Vim",
        { "edit vimrc", ":e $MYVIMRC" },
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting (F12)", ':set hlsearch!' },
      }
    }

  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require('telescope').load_extension('command_palette')
