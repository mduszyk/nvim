require("lazyrepo").clone()
require("lazy").setup(require("plugins"))
require("mappings").register()

-- default indentation
vim.opt.ts = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
-- vim.opt.colorcolumn = "100"
-- im.cmd([[highlight ColorColumn ctermbg=DarkGray guibg=DarkGray]])

