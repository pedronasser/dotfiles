local keymap = require("nvim_config.keymap")

keymap(function(nmap, vmap, imap, map, xmap)
  map("<leader>gl", "<cmd>LazyGit<CR>")
end)
