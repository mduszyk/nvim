require("plugins")
require("mappings")

vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

-- default indentation
vim.opt.ts = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- color 81st column
vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*"},
    callback = function()
        vim.fn.matchadd('CursorColumn', '\\%81v', 100)
    end
})
