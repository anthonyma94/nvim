-- Neo-tree: File explorer
return {{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
    cmd = "Neotree",
    keys = {{
        "<leader>e",
        "<cmd>Neotree toggle<cr>",
        desc = "Explorer"
    }, {
        "<leader>fe",
        "<cmd>Neotree toggle<cr>",
        desc = "Explorer (root dir)"
    }, {
        "<leader>ge",
        "<cmd>Neotree git_status toggle<cr>",
        desc = "Git explorer"
    }, {
        "<leader>be",
        "<cmd>Neotree buffers toggle<cr>",
        desc = "Buffer explorer"
    }},
    opts = {
        -- Auto-close neo-tree when opening a file
        event_handlers = {{
            event = "file_opened",
            handler = function()
                vim.cmd([[Neotree close]])
            end
        }},
        window = {
            mappings = {
                ["<space>"] = "none" -- Disable space (conflicts with leader)
            }
        },
        filesystem = {
            hijack_netrw_behavior = "open_current",
            window = {
                mappings = {
                    ["<cr>"] = function(state)
                        local node = state.tree:get_node()
                        if node.type == "file" then
                            -- Close neo-tree first
                            vim.cmd("Neotree close")
                            -- If in terminal, create new buffer, otherwise open normally
                            if vim.bo.buftype == "terminal" then
                                vim.cmd("enew")
                            end
                            vim.cmd("edit " .. vim.fn.fnameescape(node.path))
                        else
                            -- For directories, use default behavior
                            require("neo-tree.sources.filesystem.commands").toggle_node(state)
                        end
                    end
                }
            }
        }
    }
}}

