return {
    {
        "numToStr/Comment.nvim",
        -- keys = {
        --     { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
        --     { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
        -- },
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            vim.g.copilot_enabled = false
        end
    },
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
                    "markdown",
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
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {"pyright", "lua_ls"},
            }
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
            lspconfig.lua_ls.setup{
                capabilities = capabilities,
                filetypes = { "lua" },
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        telemetry = {
                            enable = false,
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                            },
                        }
                    },
                }
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
