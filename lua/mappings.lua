local mappings = {
    n = {
        ["<c-s>"] = { "<cmd>update<cr>", "Save" },
        ["<esc>"] = { "<cmd>noh<cr>", "Clear highlights" },
        ["<tab>"] = { "<c-w>w", "Switch window" },
        ["<leader>n"] = { "<cmd>Neotree toggle<cr>", "Toggle neo tree" },
        ["<leader>b"] = { "<cmd>Neotree buffers toggle<cr>", "Toggle neo tree buffers" },
        ["<leader>g"] = { "<cmd>Neotree git_status toggle<cr>", "Toggle neo tree git status" },
        -- TODO Neotree document_symbols (requires lsp)
        ["<leader>f"] = { name = "Telescope" },
        ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
        ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "Telescope grep" },
        ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
        ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
    },
    i = {
        ["<c-s>"] = { "<esc><cmd>update<cr>", "Save" },

    },
    v = {
        ["<c-s>"] = { "<esc><cmd>update<cr>", "Save" },
    }
}

return mappings
