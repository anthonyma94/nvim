-- mini.surround: Manipulate surrounding characters
return {
    "nvim-mini/mini.surround",
    version = "^0.14",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        mappings = {
            add = "ys", -- Add surrounding in Normal and Visual modes (like vim-surround)
            delete = "ds", -- Delete surrounding
            find = "", -- Find surrounding (disable)
            find_left = "", -- Find surrounding (disable)
            highlight = "", -- Highlight surrounding (disable)
            replace = "cs", -- Change/replace surrounding (like vim-surround)
            update_n_lines = "", -- Update n_lines (disable)
            suffix_last = "", -- Suffix to search with "prev" method (disable)
            suffix_next = "" -- Suffix to search with "next" method (disable)
        }
    }
}
