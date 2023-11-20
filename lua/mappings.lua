local mappings = {}

mappings.n = {
    ["<esc>"] = { "<cmd>noh<cr>", "Clear highlights" },
    ["<c-s>"] = { "<cmd>update<cr>", "Save" },
    ["<tab>"] = { "<c-w>w", "Switch window" },
    ["\\"] = { "<cmd>Neotree reveal<cr>", "Neotree show current file" },
    ["<leader>a"] = { "ggVG", "Select all" },
    ["<leader>q"] = { "<cmd>q<cr>", "Quit" },
    ["<leader>n"] = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
    ["<leader>b"] = { "<cmd>Neotree buffers toggle<cr>", "Toggle Neotree buffers" },
    ["<leader>g"] = { "<cmd>Neotree git_status toggle<cr>", "Toggle Neotree git status" },
    -- TODO Neotree document_symbols (requires lsp)
    --["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Telescope find files" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "Telescope grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
    --["<leader>u"] = { name = "UI" },
    ["<leader>un"] = { "<cmd>setlocal number!<cr>", "Toggle line numbering" },
    ["<leader>t"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
}

mappings.i = {
    ["<c-s>"] = { "<esc><cmd>update<cr>", "Save" },
}

mappings.v = {
    ["<c-s>"] = { "<esc><cmd>update<cr>", "Save" },
}

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<c-x>', [[<C-\><C-n>]], { buffer = 0, desc = "Enter normal mode" })
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local M = {}

function M.setup()
    -- local wk = require("which-key") 
    -- wk.register(mappings.n, {mode = "n"})
    -- wk.register(mappings.i, {mode = "i"})
    -- wk.register(mappings.v, {mode = "v"})

    vim.g.mapleader = " "
    for mode, maps in pairs(mappings) do
        for key, map in pairs(maps) do
            vim.api.nvim_set_keymap(mode, key, map[1], { nowait = true, desc = map[2] })
        end
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
