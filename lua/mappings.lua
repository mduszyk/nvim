local util = require("util")

vim.g.mapleader = " "
vim.opt.timeoutlen=1000

local map = vim.keymap.set

-- NORMAL
map("n", "<esc>", "<cmd>noh<cr>", {desc="Clear highlights"})
map("n", "<c-s>", "<cmd>update<cr>", {desc="Save"})
map("n", "<tab>", "<c-w>w", {desc="Switch window"})
map("n", "\\", "<cmd>Neotree reveal<cr>", {desc="Neotree show current file"})
map("n", "<leader>a", "ggVG", {desc="Select all"})
map("n", "<leader>q", "<cmd>q<cr>", {desc="Quit"})

map("n", "<leader>i", util.toggle_diagnostics, {desc="Toggle Diagnostics"})
map("n", "<leader>c", util.toggle_copilot, {desc="Toggle Copilot"})
map("n", "<leader>l", "<cmd>setlocal number!<cr>", {desc="Toggle line numbering"})

map("n", "<c-j>", "<c-e>", {desc="Scroll down"})
map("n", "<c-k>",  "<c-y>", {desc="Scroll up"})

-- Neotree
map("n", "<leader>n", "<cmd>Neotree toggle<cr>", {desc="Toggle Neotree"})
map("n", "<leader>b", "<cmd>Neotree buffers toggle<cr>", {desc="Toggle Neotree buffers"})
map("n", "<leader>g", "<cmd>Neotree git_status toggle<cr>", {desc="Toggle Neotree git status"})
map("n", "<leader>s", "<cmd>Neotree document_symbols toggle<cr>", {desc="Symbols"})

-- Telescope
-- map("n", "<leader>f", "<cmd>Telescope find_files<cr>", {desc="Telescope find files"})
-- sudo pacman -S ripgrep
map("n", "<leader>f", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>", {desc="Telescope find files"})
map("n", "<leader>w", "<cmd>Telescope live_grep<cr>", {desc="Telescope grep"})
map("n", "<leader>h", "<cmd>Telescope help_tags<cr>", {desc="Telescope help tags"})
map("n", "<leader>B", "<cmd>Telescope buffers<cr>", {desc="Telescope buffers"})
map("n", "<leader>G", "<cmd>Telescope git_commits<cr>", {desc="Telescope git commits"})

-- LSP
map("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename Symbol"})
map("n", "<leader>gd", vim.lsp.buf.definition, {desc = "Goto Definition"})
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action"})
map("n", "K", vim.lsp.buf.hover, {desc = "Hover Documentation"})
map("n", "<leader>F", vim.lsp.buf.format, {desc = "Format Code"})

vim.api.nvim_set_keymap('i', '<c-j>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
vim.api.nvim_set_keymap('i', '<c-k>', 'copilot#Next()', {expr=true, silent=true})

-- INPUT
map("i", "<c-s>", "<esc><cmd>update<cr>", {desc="Save"})

-- VISUAL
map("v", "<c-s>", "<esc><cmd>update<cr>", {desc="Save"})

-- ToggleTerm
map("n", "<leader>t", "<cmd>ToggleTerm<cr>", {desc="Toggle terminal"})

vim.api.nvim_create_autocmd({"TermOpen"}, {
    pattern = {"term://*"},
    callback = function()
        map("t", "<c-x>", [[<C-\><C-n>]], {buffer = 0, desc = "Enter normal mode"})
        local opts = {buffer = 0}
        map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end
})
