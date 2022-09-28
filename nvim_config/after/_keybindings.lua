local keymap = require("nvim_config.keymap")

keymap(function(nmap, vmap, imap, map, xmap)
  map("<C-Right>", "w")
  imap("<C-Right>", "<ESC>wi")
  map("<C-Left>", "b")
  imap("<C-Left>", "<ESC>bi")

  -- Select current line
  nmap("<C-L>", "0vg_V")
  vmap("<C-L>", "og0og_V")
  imap("<C-L>", "<ESC>0vg_V")

  map("<A-Left>", "vb")
  imap("<A-Right>", "<ESC>vb")

  -- Keybindings to move lines
  -- Bubble single lines
  nmap("<C-S-Up>", "ddkP")
  nmap("<C-S-Down>", "ddp")
  -- Bubble multiple lines
  vmap("<C-S-Up>", "xkP`[V`]")
  vmap("<C-S-Down>", "xp`[V`]")

  -- move current line down one line
  map("<C-S-Down>", "<cmd><C-u>m+<cr>==")

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

  -- Changing Backspace behavior 
  vmap("<Backspace>", "\"_d")

  -- Make backspace on normal mode change to insert mode for convenience 
  nmap("<Backspace>", "i<Backspace>")

  -- Selecting all buffer
  map("<C-A>", "<esc>ggVG<CR>")

  -- Duplicate the current line
  vmap("<Space>dl", "<ESC>Yp")
  nmap("<Space>dl", "<ESC>vYp")

  -- Delete current line
  map("<C-Delete>", "<ESC>dd")
  -- Change <Delete> behaior on normal mode
  nmap("<Delete>", "xi")

  -- Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
  map("<C-X>", "\"0ygv\"*d")
  map("<C-V>", "x\"0gpi<right>")
  imap("<C-V>", "<ESC>\"0pi<right>")
  xmap("<A-C>", "\"0ygv\"*y<ESC>")
  vmap("<A-C>", "\"0ygv\"*y<ESC>")
  imap("<A-C>", "<ESC>0vg_\"0ygv\"*y<ESC>")
  xmap("<C-C>", "\"0ygv\"*y<ESC>")
  vmap("<C-C>", "\"0ygv\"*y<ESC>")
  imap("<C-C>", "<ESC>0vg_\"0ygv\"*y<ESC>")

  -- Move indentation
  nmap("<Tab>", "0V$>")
  nmap("<S-Tab>", "0V$<")
  vmap("<Tab>", ">gv")
  vmap("<S-Tab>", "<gv")

  -- CTRL+S to Save
  map("<C-S>", "<cmd>update<CR>")
  vmap("<C-S>", "<C-C><cmd>update<CR>")
  imap("<C-S>", "<C-O><cmd>update<CR>")

  -- Undo/redo
  map("<C-z>", "<ESC>u")
  map("<C-y>", "<ESC><C-R>")
  imap("<C-z>", "<ESC>ui")
  imap("<C-y>", "<ESC><C-R>i")

  -- Ctrl-G bind to go to line by number
  map("<C-G>", "<ESC>:")

  -- Change recording to be Ctrl-R
  map("<C-R>", "<ESC>q")
  map("q","<Nop>")

  imap("<Esc>", "<Esc>`^")

end)


