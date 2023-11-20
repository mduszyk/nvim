local plugins = {
    {
        'navarasu/onedark.nvim',
        config = function()
            local onedark = require("onedark")
            onedark.setup {
                style = 'darker',
                code_style = {
                    comments = 'none',
                },
            }
            onedark.load()
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    }
}

table.insert(plugins, require("plugins.neotree"))

local M = {}

function M.setup()
    require("lazyrepo").clone()
    require("lazy").setup(plugins)
end

return M
