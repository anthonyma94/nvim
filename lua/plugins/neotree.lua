return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            vim.cmd([[Neotree close]])
          end,
        },
      },
    },
  },
}
