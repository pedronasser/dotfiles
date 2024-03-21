vim.opt.showmatch = true
vim.opt.ignorecase = false
vim.opt.selection = "inclusive"
vim.opt.autoindent = false
vim.opt.compatible = false
vim.opt.autoread = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.smartindent = false
vim.opt.spell = false
vim.opt.wildmode = { "longest", "list" }
vim.opt.ch = 0

vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = false

vim.opt.cindent = false
vim.opt.indentexpr = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.showmode = false
-- vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.encoding = "UTF-8"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.completeopt = { "menuone", "noinsert" }

vim.opt.shortmess:append({ a = true, T = true })
vim.opt.scroll = 1
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "0"
vim.opt.swapfile = false
vim.opt.guifont = ""
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.wrap = false

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.browsedir = "current"

vim.opt.termguicolors = true

vim.opt.cmdheight = 0

vim.cmd[[set relativenumber nu]]
