-- Telescope: Fuzzy finder
return {{
    "nvim-telescope/telescope.nvim",
    version = "^0.1",
    dependencies = {{
        "nvim-lua/plenary.nvim",
        version = "^0.1"
    }},
    cmd = "Telescope",
    keys = { -- Buffer picker
    {
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Switch buffer"
    }, -- File finder
    {
        "<leader><space>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
    }, {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
    }, -- Search
    {
        "<leader>/",
        "<cmd>Telescope live_grep<cr>",
        desc = "Grep"
    }, {
        "<leader>sg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Grep"
    }},
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            file_ignore_patterns = {"node_modules", "%.pnpm%-store", "%.git/", "%.nx/", "%.turbo/", "test%-results/",
                                    "playwright%-report/", "venv", "%.venv", "__pycache__", "%.pytest_cache",
                                    "%.mypy_cache", "%.tox", "%.egg%-info", "dist/", "build/", "target/", "vendor/",
                                    "%.min%.js", "%.min%.css"},
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous"
                }
            }
        }
    }
}}
