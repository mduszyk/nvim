local M = {
    url = "https://github.com/folke/lazy.nvim.git",
    branch = "stable",
    path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
}

function M.clone()
    if not vim.loop.fs_stat(M.path) then
        local util = require("util")
        cmd = { "git", "clone", "--filter=blob:none", "--branch=" .. M.branch, M.url, M.path }
        util.shell(cmd) 
    end
    vim.opt.rtp:prepend(M.path)
end

return M
