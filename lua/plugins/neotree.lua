return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup({
            -- see: neo-tree.nvim/lua/neo-tree/defaults.lua
            use_popups_for_input = false,
            popup_border_style = "rounded",
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            source_selector = {
                winbar = true,
            },
            default_component_configs = {
                indent = {
                    with_markers = false
                },
                name = {
                    use_git_status_colors = false,
                },
                git_status = {
                    symbols = {
                        added     = "+",
                        deleted   = "x",
                        modified  = ".",
                        renamed   = "r",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "!",
                    },
                },
            },
            use_default_mappings = false,
            window = {
                width = 32,
                mapping_options = { noremap = true, nowait = true, },
                mappings = {
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["o"] = "open",
                    ["<esc>"] = "revert_preview",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    ["t"] = "open_tabnew",
                    ["w"] = "open_with_window_picker",
                    ["C"] = "close_node",
                    ["R"] = "refresh",
                    ["a"] = { "add", config = { show_path = "relative" } },
                    ["c"] = { "copy",  config = { show_path = "relative" } },
                    ["m"] = { "move", config = { show_path = "relative" } },
                    ["A"] = { "add_directory", config = { show_path = "relative" } },
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["e"] = "toggle_auto_expand_width",
                    ["q"] = "close_window",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                    -- ["<space>"] = { "toggle_node", nowait = false },
                    -- ["z"] = "close_all_nodes",
                    -- ["Z"] = "expand_all_nodes",
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    -- ["<cr>"] = "open_drop",
                    -- ["t"] = "open_tab_drop",
                }
            },
            filesystem = {
                use_libuv_file_watcher = true,
                window = {
                    mappings = {
                        ["H"] = "toggle_hidden",
                        ["/"] = "fuzzy_finder",
                        ["D"] = "fuzzy_finder_directory",
                        ["f"] = "filter_on_submit",
                        ["<C-x>"] = "clear_filter",
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                        ["[g"] = "prev_git_modified",
                        ["]g"] = "next_git_modified",
                    }
                }
            },
            buffers = {
                window = {
                    mappings = {
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                        ["d"] = "buffer_delete",
                    }
                }
            },
            git_status = {
                window = {
                    mappings = {
                        ["A"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    }
                }
            }
        })
    end
}
