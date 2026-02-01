-- Autocmds
-- Auto-enter terminal mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        -- Start in insert mode
        vim.cmd("startinsert")
    end
})
