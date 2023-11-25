require("plugins")
require("mappings")

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.nuw = 3
vim.opt.signcolumn = "yes"

-- default indentation
vim.opt.ts = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.spelllang = "en_gb"
vim.opt.spell = true

-- color 101st column
vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*"},
    callback = function()
        vim.fn.matchadd('CursorColumn', '\\%101v', 100)
    end
})

vim.diagnostic.disable()
