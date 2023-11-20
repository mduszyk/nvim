local plugins = {
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'darker',
                code_style = {
                    comments = 'none',
                },
            }
            require('onedark').load()
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            require("neo-tree").setup({
                sources = { "filesystem", "buffers", "git_status" },
                source_selector = {
                    winbar = true,
                },
                default_component_configs = {
                    indent = {
                        with_markers = false
                    }
                },
                window = {
                    width = 32,
                    mapping_options = { noremap = true, nowait = true, },
                    mappings = {
                        ["o"] = {"open", nowait = true, noremap = true},
                    }
                },
                filesystem = {
                    window = {
                        mappings = {
                        }
                    }
                },
                buffers = {
                    window = {
                        mappings = {
                        }
                    }
                },
                git_status = {
                    window = {
                        mappings = {
                        }
                    }
                }
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    }
}

return plugins
