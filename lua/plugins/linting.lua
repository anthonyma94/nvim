-- nvim-lint: Code linting
return {
    "mfussenegger/nvim-lint",
    version = "^0.6",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = {"eslint_d"},
            typescript = {"eslint_d"},
            javascriptreact = {"eslint_d"},
            typescriptreact = {"eslint_d"},
            bash = {"shellcheck"},
            sh = {"shellcheck"}
        }

        -- Auto-lint on save and text change
        vim.api.nvim_create_autocmd({"BufWritePost", "BufEnter", "InsertLeave"}, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}
