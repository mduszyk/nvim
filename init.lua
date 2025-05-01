require("lazyrepo").clone()
require("lazy").setup(require("plugins"))
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

-- Instead of failing a command because of unsaved changes, raise a
-- dialogue asking if you wish to save changed files.
vim.opt.confirm = true
-- use case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true

-- color 81st column
vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*"},
    callback = function()
        vim.fn.matchadd('CursorColumn', '\\%81v', 80)
    end
})

-- vim.diagnostic.disable()
vim.diagnostic.enable(false)

vim.o.title = true
vim.o.titlestring = "nvim %F"

-- Source the project-specific init
local project_setup_file = vim.fn.getcwd() .. "/.nvim/init.lua"
if vim.fn.filereadable(project_setup_file) == 1 then
    dofile(project_setup_file)  
end
