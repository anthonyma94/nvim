-- mini.statusline: Status line at bottom
return {
    "nvim-mini/mini.statusline",
    version = "^0.14",
    event = "VeryLazy",
    config = function()
        local statusline = require("mini.statusline")
        statusline.setup({
            use_icons = true,
            set_vim_settings = true,
            content = {
                active = function()
                    -- Check if we're in neo-tree
                    if vim.bo.filetype == "neo-tree" then
                        local cwd = vim.fn.getcwd()
                        local dir_name = vim.fn.fnamemodify(cwd, ":~")
                        return statusline.combine_groups({{
                            hl = "MiniStatuslineFilename",
                            strings = {dir_name}
                        }})
                    end

                    -- Default statusline for other buffers
                    -- Custom mode names (spelled out)
                    local mode_info = vim.api.nvim_get_mode()
                    local mode_map = {
                        ['n'] = 'NORMAL',
                        ['i'] = 'INSERT',
                        ['v'] = 'VISUAL',
                        ['V'] = 'V-LINE',
                        ['\22'] = 'V-BLOCK',
                        ['c'] = 'COMMAND',
                        ['s'] = 'SELECT',
                        ['S'] = 'S-LINE',
                        ['\19'] = 'S-BLOCK',
                        ['R'] = 'REPLACE',
                        ['r'] = 'REPLACE',
                        ['!'] = 'SHELL',
                        ['t'] = 'TERMINAL'
                    }
                    local mode = mode_map[mode_info.mode] or 'UNKNOWN'
                    local _, mode_hl = statusline.section_mode({
                        trunc_width = 120
                    })

                    local git = statusline.section_git({
                        trunc_width = 75
                    })
                    local diagnostics = statusline.section_diagnostics({
                        trunc_width = 75
                    })
                    local filename = statusline.section_filename({
                        trunc_width = 140
                    })
                    local fileinfo = statusline.section_fileinfo({
                        trunc_width = 120
                    })
                    local location = statusline.section_location({
                        trunc_width = 75
                    })
                    local search = statusline.section_searchcount({
                        trunc_width = 75
                    })

                    return statusline.combine_groups({{
                        hl = mode_hl,
                        strings = {mode}
                    }, {
                        hl = 'MiniStatuslineDevinfo',
                        strings = {git, diagnostics}
                    }, '%<', -- Mark general truncate point
                    {
                        hl = 'MiniStatuslineFilename',
                        strings = {filename}
                    }, '%=', -- End left alignment
                    {
                        hl = 'MiniStatuslineFileinfo',
                        strings = {fileinfo}
                    }, {
                        hl = mode_hl,
                        strings = {search, location}
                    }})
                end
            }
        })

        -- Override mode names to be spelled out
        statusline.config.set_vim_settings = false
        vim.o.showmode = false
    end
}
