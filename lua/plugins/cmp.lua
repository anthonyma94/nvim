-- nvim-cmp: Completion engine
return {
    "hrsh7th/nvim-cmp",
    version = "^0.0",
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {"hrsh7th/cmp-nvim-lsp", -- LSP source
    "hrsh7th/cmp-buffer", -- Buffer source
    "hrsh7th/cmp-path", -- Path source
    "hrsh7th/cmp-cmdline" -- Cmdline source
    },
    config = function()
        local cmp = require("cmp")

        -- Main setup
        cmp.setup({
            snippet = {
                expand = function(args)
                    -- No snippet engine for now
                    vim.snippet.expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                })
            }),
            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }, {
                name = "buffer"
            }, {
                name = "path"
            }}),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            }
        })

        -- Cmdline setup for search (/ and ?)
        cmp.setup.cmdline({"/", "?"}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{
                name = "buffer"
            }}
        })

        -- Cmdline setup for commands (:)
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{
                name = "path"
            }}, {{
                name = "cmdline"
            }})
        })
    end
}
