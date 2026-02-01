-- mini.jump2d: Jump to any visible location (like easymotion)
return {
    "nvim-mini/mini.jump2d",
    version = "^0.14",
    keys = {{
        "<leader>jl",
        function()
            require("mini.jump2d").start(require("mini.jump2d").builtin_opts.line_start)
        end,
        desc = "Jump to line"
    }, {
        "<leader>jw",
        function()
            require("mini.jump2d").start(require("mini.jump2d").builtin_opts.word_start)
        end,
        desc = "Jump to word"
    }, {
        "<leader>jj",
        function()
            require("mini.jump2d").start(require("mini.jump2d").builtin_opts.single_character)
        end,
        mode = {"n", "x", "o"},
        desc = "Jump to character"
    }},
    config = function()
        require("mini.jump2d").setup({
            -- Use home row keys for labels
            labels = "asdfjklghqwertyuiopzxcvbnm",
            -- Customize visual appearance
            mappings = {
                start_jumping = ""
            }
        })

        -- Make jump labels more visible with high contrast colors
        vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
            fg = "#ff007c",
            bg = "#ffffff",
            bold = true,
            nocombine = true
        })
        vim.api.nvim_set_hl(0, "MiniJump2dSpotAhead", {
            fg = "#00dfff",
            bg = "#ffffff",
            bold = true,
            nocombine = true
        })
        vim.api.nvim_set_hl(0, "MiniJump2dSpotUnique", {
            fg = "#ff007c",
            bg = "#ffff00",
            bold = true,
            nocombine = true
        })
    end
}
