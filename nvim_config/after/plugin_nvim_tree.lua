local keymap = require("nvim_config.keymap")

keymap(function(nmap, vmap, imap, map, xmap)
  map("<C-B>", "<ESC>:NvimTreeToggle<cr>")
  map("<C-O>", ":NvimTreeFocus<cr>")

  imap("<C-O>", ":NvimTreeFocus<cr>")
  imap("<C-B>", "<ESC>:NvimTreeToggle<cr>")
end)


require("nvim-tree").setup({
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    hide_root_folder = false,
    adaptive_size = true,
    signcolumn = "yes",
    -- width = 25,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  git = {
    ignore = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    group_empty = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
      git_placement = "after"
    }
  },
  update_focused_file = {
    enable = true
  },
  diagnostics = {
    enable = true
  }
})
