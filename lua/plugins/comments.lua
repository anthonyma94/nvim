return {
  {
    "echasnovski/mini.comment",
    opts = {},
    config = function()
      require("mini.comment").setup()
      vim.api.nvim_command("autocmd FileType nix setlocal commentstring=#\\ %s")
    end,
    lazy = false,
  },
}
