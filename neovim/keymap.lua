local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true, silent = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local map = bind("")
local nmap = bind("n")
local vmap = bind("v")
local xmap = bind("x")
local imap = bind("i")

return function(setup)
  setup(nmap, vmap, imap, map, xmap)
end
