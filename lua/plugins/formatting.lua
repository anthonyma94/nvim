-- conform.nvim: Code formatting
return {
    "stevearc/conform.nvim",
    version = "^8.0",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        formatters_by_ft = {
            javascript = {"prettier"},
            typescript = {"prettier"},
            javascriptreact = {"prettier"},
            typescriptreact = {"prettier"},
            json = {"prettier"},
            html = {"prettier"},
            css = {"prettier"},
            markdown = {"prettier"},
            bash = {"shfmt"},
            sh = {"shfmt"}
        },
        formatters = {
            shfmt = {
                prepend_args = {"-i", "4"} -- 4 spaces instead of tabs
            }
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true
        }
    }
}
