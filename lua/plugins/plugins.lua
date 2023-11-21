return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "bash",
                    "python",
                },
                highlight = {
                    enable = true,
                }
            }
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup {
                capabilities = capabilities,
                filetypes = { "python" }
            }
        end
    },
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
            -- require("luasnip.loaders.from_lua").load({paths = "./snippets"})
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
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
