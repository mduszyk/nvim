local util = require("util")

local M = {
    path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
}

function M.install()
    if not vim.loop.fs_stat(M.path) then
        print("Clonning lazy.nvim to " .. M.path)
        util.shell_call {
            "git",
            "clone",
            "--filter=blob:none",
            "--branch=stable",
            "https://github.com/folke/lazy.nvim.git",
            M.path
        }
    end
    vim.opt.rtp:prepend(M.path)
end

return M

