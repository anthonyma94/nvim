-- Keymaps
local map = vim.keymap.set

-- Exit insert mode
map("i", "jk", "<Esc>", {
    desc = "Exit insert mode"
})

-- Delete word backwards in insert mode (Windows-style)
map("i", "<C-BS>", "<C-w>", {
    desc = "Delete word backwards"
})
map("i", "<C-H>", "<C-w>", {
    desc = "Delete word backwards (fallback)"
})

-- Lazy plugin manager
map("n", "<leader>l", "<cmd>Lazy<cr>", {
    desc = "Lazy"
})

-- Mason (LSP installer)
map("n", "<leader>cm", "<cmd>Mason<cr>", {
    desc = "Mason"
})

-- LSP keymaps (set when LSP attaches to buffer)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = {
            buffer = args.buf
        }
        map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
            desc = "Go to definition"
        }))
        map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, {
            desc = "Go to references"
        }))
        map("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
            desc = "Go to implementation"
        }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
            desc = "Hover documentation"
        }))
        map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
            desc = "Code action"
        }))
        map("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
            desc = "Rename"
        }))
        map("n", "<leader>cd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
            desc = "Line diagnostics"
        }))
        map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, {
            desc = "Previous diagnostic"
        }))
        map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, {
            desc = "Next diagnostic"
        }))
    end
})

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", {
    desc = "Prev buffer"
})
map("n", "<S-l>", "<cmd>bnext<cr>", {
    desc = "Next buffer"
})
map("n", "<leader>bd", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd("bdelete!")
    else
        vim.cmd("bdelete")
    end
end, {
    desc = "Delete buffer"
})
map("n", "<leader>bD", "<cmd>bdelete!<cr>", {
    desc = "Force delete buffer"
})
map("n", "<leader>`", "<cmd>e #<cr>", {
    desc = "Switch to other buffer"
})

-- Terminal
map("n", "<leader>,", function()
    vim.cmd("enew | terminal")
end, {
    desc = "Terminal (new buffer)"
})

-- Window splits
map("n", "<leader>wj", "<cmd>split<cr>", {
    desc = "Split window below"
})
map("n", "<leader>wk", "<cmd>split<cr><C-w>k", {
    desc = "Split window above"
})
map("n", "<leader>wl", "<cmd>vsplit<cr>", {
    desc = "Split window right"
})
map("n", "<leader>wh", "<cmd>vsplit<cr><C-w>h", {
    desc = "Split window left"
})
map("n", "<leader>wd", "<C-w>c", {
    desc = "Delete window"
})

-- Window navigation (move between splits)
map("n", "<C-h>", "<C-w>h", {
    desc = "Go to left window"
})
map("n", "<C-j>", "<C-w>j", {
    desc = "Go to lower window"
})
map("n", "<C-k>", "<C-w>k", {
    desc = "Go to upper window"
})
map("n", "<C-l>", "<C-w>l", {
    desc = "Go to right window"
})

-- Terminal
map("n", "<leader>ft", function()
    vim.cmd("enew | terminal")
end, {
    desc = "Terminal (new buffer)"
})
map("n", "<leader>'", function()
    vim.cmd("enew | terminal")
end, {
    desc = "Terminal (new buffer)"
})
map("n", "<leader>fT", function()
    vim.cmd("vsplit | terminal")
end, {
    desc = "Terminal (vertical split)"
})

-- Terminal mode keymaps
map("t", "jk", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})
map("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})
map("t", "<C-h>", "<C-\\><C-n><C-w>h", {
    desc = "Go to left window"
})
map("t", "<C-j>", "<C-\\><C-n><C-w>j", {
    desc = "Go to lower window"
})
map("t", "<C-k>", "<C-\\><C-n><C-w>k", {
    desc = "Go to upper window"
})
map("t", "<C-l>", "<C-\\><C-n><C-w>l", {
    desc = "Go to right window"
})
