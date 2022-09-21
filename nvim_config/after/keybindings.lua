local keymap = require("nvim_config.keymap")

keymap(function(nmap, vmap, imap, map, xmap)
  -- Hotkey to open the file explorer

  map("<Space><Tab>", "<cmd>BufferNext")
  -- Re-order to previous/next
  map("<C-A-Left>", "<cmd>BufferMovePrevious")
  map("<C-A-Right>", "<cmd>BufferMoveNext")
  -- Goto buffer in position...
  map("<Space>1", "<cmd>BufferGoto 1")
  map("<Space>2", "<cmd>BufferGoto 2")
  map("<Space>3", "<cmd>BufferGoto 3")
  map("<Space>4", "<cmd>BufferGoto 4")
  map("<Space>5", "<cmd>BufferGoto 5")
  map("<Space>6", "<cmd>BufferGoto 6")
  map("<Space>7", "<cmd>BufferGoto 7")
  map("<Space>8", "<cmd>BufferGoto 8")
  map("<Space>9", "<cmd>BufferGoto 9")
  map("<Space>10", "<cmd>BufferLast")
  map("<Space>w", "<cmd>BufferClose")

  -- Select current line
  nmap("<C-l>", "0vg_V")
  vmap("<C-l>", "og0og_V")
  imap("<C-l>", "<ESC>0vg_V")

  -- Reload vim configuration
  map("<C-A-r>", "<cmd>source " .. vim.env.MYVIMRC)

  -- Keybindings to move lines
  -- Bubble single lines
  nmap("<C-S-Up>", "ddkP")
  nmap("<C-S-Down>", "ddp")
  -- Bubble multiple lines
  vmap("<C-S-Up>", "xkP`[V`]")
  vmap("<C-S-Down>", "xp`[V`]")

  -- move current line down one line
  map("<C-S-Down>", "<cmd><C-u>m+<CR>==")

  xmap("<S-Up>", "<Up>")
  xmap("<S-Down>", "<Down>")
  xmap("<S-Left>", "<Left>")
  xmap("<S-Right>", "<Right>")

  map("<S-Up>", "v<Up>")
  map("<S-Down>", "v<Down>")
  map("<S-Left>", "v<Left>")
  map("<S-Right>", "v<Right>")

  vmap("<S-Up>", "<Up>")
  vmap("<S-Down>", "<Down>")
  vmap("<S-Left>", "<Left>")
  vmap("<S-Right>", "<Right>")

  imap("<S-Up>", "<ESC>v<Up>")
  imap("<S-Down>", "<ESC>v<Down>")
  imap("<S-Left>", "<ESC>v<Left>")
  imap("<S-Right>", "<ESC>v<Right>")

  -- Make Home and End keys work
  map("<ESC>[8~", "<End>")
  map("<ESC>[7~", "<Home>")
  imap("<ESC>[8~", "<End>")
  imap("<ESC>[7~", "<Home>")

  -- Delete on normal end visual mode
  vmap("<bs>", "\"_d")
  nmap("<bs>", "\"_d")

  map("<C-a>", "<esc>ggVG<CR>")

  -- Duplicate the current line
  map("<C-d>", "<ESC>Yp")
  map("<C-d>", "<ESC>Yp")

  -- Delete current line
  map("<C-Delete>", "<ESC>dd")
  nmap("<Delete>", "xi")

  -- Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
  map("<C-X>", "\"0ygv\"*d")

  map("<C-v>", "x\"0gPi<right>")
  imap("<C-v>", "<ESC>\"0Pi<right>")



  xmap("<A-c>", "\"0ygv\"*y<ESC>")
  vmap("<A-c>", "\"0ygv\"*y<ESC>")
  imap("<A-c>", "<ESC>0vg_\"0ygv\"*y<ESC>")

  xmap("<C-c>", "\"0ygv\"*y<ESC>")
  vmap("<C-c>", "\"0ygv\"*y<ESC>")
  imap("<C-c>", "<ESC>0vg_\"0ygv\"*y<ESC>")

  nmap("<Tab>", "0V$>")
  nmap("<S-Tab>", "0V$<")
  vmap("<Tab>", ">gv")
  vmap("<S-Tab>", "<gv")

  -- CTRL+S to Save
  map("<C-S>", "<cmd>update<CR>")
  vmap("<C-S>", "<C-C><cmd>update<CR>")
  imap("<C-S>", "<C-O><cmd>update<CR>")

  map("<C-z>", "<ESC>u")
  map("<C-y>", "<ESC><C-R>")
  imap("<C-z>", "<ESC>ui")
  imap("<C-y>", "<ESC><C-R>i")
  map("<C-G>", "<ESC>:")
  map("<C-A-J>", "<cmd>TroubleToggle<cr>")

  nmap("<Backspace>", "i<Backspace>")

  imap("<ESC>f", "<S-Right>")
  nmap("<ESC>f", "i<S-Right>")

  imap("<C-Right>", "<Esc>$a")
  imap("<C-Left>", "<Esc>0")

  map("q", "<Nop>")

end)


