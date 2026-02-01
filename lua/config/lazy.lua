-- Bootstrap lazy.nvim (auto-install the plugin manager if it doesn't exist)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  -- Clone lazy.nvim if not found
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path

-- Set leader keys before lazy loads
vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = "\\" -- Backslash as local leader

-- Load core configuration
require("config.options") -- Editor options (line numbers, indentation, etc.)
require("config.keymaps") -- Key mappings
require("config.autocmds") -- Auto commands

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import all plugins from lua/plugins/
    { import = "plugins" },
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- Auto-check for plugin updates
  performance = {
    rtp = {
      -- Disable built-in plugins we don't need (faster startup)
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
