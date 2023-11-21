return {
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
}
