local plugins = {
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
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            --'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require('luasnip')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources(
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }
                ),
                mapping = cmp.mapping.preset.insert ({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<s-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select=true }),
                }),
            }
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

table.insert(plugins, require("plugins.neotree"))

local M = {}

function M.setup()
    require("plugins.lazyrepo").clone()
    require("lazy").setup(plugins)
end

return M
