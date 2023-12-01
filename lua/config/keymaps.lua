-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- Sets exiting insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Remaps moving up/down
vim.keymap.set("n", "<A-u>", "<C-u>")
vim.keymap.set("n", "<A-d>", "<C-d>")

-- Sets terminal toggling
local lazyterm = function()
  Util.terminal.open(nil, { cwd = Util.root.get() })
end
vim.keymap.set("n", "<A-(>", lazyterm)
vim.keymap.set("t", "<A-(>", "<cmd>close<cr>")

-- Sets sidebar toggling
vim.keymap.set({ "n", "x" }, "<A-)>", "<cmd>Neotree toggle=true<cr>")

-- Sets comment toggling in visual mode
vim.keymap.set("x", "<C-_>", [[:<C-u>lua MiniComment.operator("visual")<CR>]], { noremap = true })

-- Toggle commenting for the line
vim.keymap.set("n", "<C-_>", "g@_")

vim.keymap.set("n", "yss", "ys_", { remap = true })
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add("visual")<CR>]], { noremap = true, silent = true })
