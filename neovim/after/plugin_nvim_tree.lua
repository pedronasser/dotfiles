local keymap = require("nvim_config.keymap")
local nvimtree = require("nvim-tree")

local function toggle()
  local view = require("nvim-tree.view")
  if not view.is_visible() then
    require("dapui").close()
  end

  nvimtree.toggle()
end

keymap(function(nmap, vmap, imap, map, xmap)
  map("<C-B>", toggle)
  imap("<C-B>", toggle)
end)

nvimtree.setup({
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
    side = 'right'
  },
  git = {
    ignore = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    group_empty = false,
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
