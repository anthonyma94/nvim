-- Editor options
-- Suppress deprecation warnings from plugins
vim.deprecate = function()
end

-- Suppress swapfile warnings for Neovim processes
vim.opt.shortmess:append("A")

-- Line numbers
vim.opt.number = true -- Show absolute line number on cursor line
vim.opt.relativenumber = true -- Show relative line numbers

-- Word wrapping
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Break lines at word boundaries

-- Indentation settings
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces tabs count for in insert mode
vim.opt.smartindent = true -- Insert indents automatically

-- Diagnostic display configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Could be '■', '▎', 'x', '●'
        spacing = 4
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
    }
})

-- LSP handlers with rounded borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
