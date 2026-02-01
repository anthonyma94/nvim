-- Which-key: shows available keybindings in a popup
return {{
    "folke/which-key.nvim",
    version = "^3.0", -- Pin to major version 3.x
    event = "VeryLazy", -- Load after startup
    opts = {
        -- Plugin configuration
        plugins = {
            spelling = true -- Show spelling suggestions
        }
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Register key groups (these show up as menu headers)
        wk.add({{
            "<leader>f",
            group = "file/find"
        }, {
            "<leader>g",
            group = "git"
        }, {
            "<leader>j",
            group = "jump",
            icon = "󰼁"
        }, {
            "<leader>s",
            group = "search"
        }, {
            "<leader>u",
            group = "ui"
        }, {
            "<leader>c",
            group = "code"
        }, {
            "<leader>b",
            group = "buffer"
        }, {
            "<leader>w",
            group = "window"
        }, {
            "<leader>q",
            group = "quit/session"
        }, {
            "<leader>x",
            group = "diagnostics/quickfix"
        }, {
            "<leader><tab>",
            group = "tabs"
        }, {
            "<leader>C",
            group = "GitHub Copilot"
        }})
    end
}}
