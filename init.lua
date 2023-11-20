require("lazyrepo").clone()
require("lazy").setup(require("plugins"))
require("mappings").register()

vim.g.mapleader = " "

-- default indentation
vim.opt.ts = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.colorcolumn = "100"
vim.cmd([[highlight ColorColumn ctermbg=DarkGray guibg=DarkGray]])

