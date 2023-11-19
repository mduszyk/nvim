require("lazy_init").install()
local plugins = require("plugins")
require("lazy").setup(plugins)

vim.g.mapleader = " "
local mappings = require("mappings")
local wk = require("which-key") 
wk.register(mappings["n"], {mode = "n"})
wk.register(mappings["i"], {mode = "i"})
wk.register(mappings["v"], {mode = "v"})

vim.opt.number = true
vim.opt.colorcolumn = "100"
vim.cmd [[highlight ColorColumn ctermbg=DarkGray guibg=DarkGray]]

-- default indentation
vim.opt.ts = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- use spaces instead of tabs
vim.opt.expandtab = true

