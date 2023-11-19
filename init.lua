require("lazy_install")
local plugins = require("plugins")
local lazy = require("lazy")
lazy.setup(plugins)

vim.g.mapleader = " "
vim.opt.number = true
--vim.opt.colorcolumn = "80"

