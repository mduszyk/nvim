require("lazy_install")
local plugins = require("plugins")
local lazy = require("lazy")
lazy.setup(plugins)

vim.g.mapleader = " "
local mappings = require("mappings")
local wk = require("which-key") 
wk.register(mappings, {mode = "n"})

vim.opt.number = true
--vim.opt.colorcolumn = "80"

