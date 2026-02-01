-- noice.nvim: Better UI for messages, cmdline and popupmenu
return {
    "folke/noice.nvim",
    version = "^4.0",
    event = "VeryLazy",
    dependencies = {"MunifTanjim/nui.nvim"},
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup", -- Popup instead of bottom cmdline
            opts = {
                position = {
                    row = "20%", -- Position near top of screen
                    col = "50%"
                }
            }
        },
        messages = {
            enabled = false -- Keep messages simple
        },
        popupmenu = {
            enabled = true,
            backend = "nui" -- Use nui for completion menu
        },
        notify = {
            enabled = false -- Don't use noice for notifications
        },
        lsp = {
            -- Override markdown rendering for LSP hover/signature
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true
            },
            signature = {
                enabled = true
            },
            hover = {
                enabled = true
            }
        },
        presets = {
            bottom_search = true, -- Classic bottom search
            command_palette = false, -- Don't position cmdline/popup together
            long_message_to_split = true -- Long messages to split
        }
    }
}
