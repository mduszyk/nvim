local mappings = {
    ["<tab>"] = { "<c-w>w", "Switch window" },
    ["<leader>n"] = { "<cmd>Neotree toggle<cr>", "Toggle neo tree" },
    ["<leader>b"] = { "<cmd>Neotree buffers toggle<cr>", "Toggle neo tree buffers" },
    ["<leader>g"] = { "<cmd>Neotree git_status toggle<cr>", "Toggle neo tree git status" },
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "Telescope grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
}

return mappings
