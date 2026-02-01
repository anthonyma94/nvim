-- Colorscheme
return {
  {
    "folke/tokyonight.nvim",
    version = "^4.0", -- Pin to major version 4.x
    lazy = false, -- Load immediately at startup
    priority = 1000, -- Load before other plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
