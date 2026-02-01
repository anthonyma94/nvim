-- LSP Configuration
return { -- Mason: LSP/formatter/linter installer
{
    "mason-org/mason.nvim",
    version = "^1.0",
    cmd = "Mason",
    opts = {
        ui = {
            border = "rounded"
        }
    }
}, -- Mason-tool-installer: Auto-install formatters and linters
{
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    version = "^1.0",
    dependencies = {"mason-org/mason.nvim"},
    opts = {
        ensure_installed = {"prettier", -- TypeScript/JavaScript formatter
        "eslint_d", -- TypeScript/JavaScript linter
        "shellcheck", -- Bash linter
        "shfmt" -- Bash formatter
        },
        auto_update = false,
        run_on_start = true
    }
}, -- Mason-lspconfig: bridges mason and lspconfig
{
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0",
    dependencies = {"mason-org/mason.nvim"},
    opts = {
        -- Auto-install these LSP servers (using lspconfig names, not Mason names)
        ensure_installed = {"lua_ls", -- Lua
        "pyright", -- Python
        "vtsls", -- TypeScript/JavaScript
        "bashls", -- Bash
        "jsonls", -- JSON
        "html", -- HTML
        "cssls" -- CSS
        }
    }
}, -- nvim-lspconfig: Configure LSP servers
{
    "neovim/nvim-lspconfig",
    version = "^0.1",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {"mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim"},
    config = function()
        -- Get cmp-nvim-lsp capabilities if available
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if has_cmp then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        -- Auto-setup servers installed via mason-lspconfig
        require("mason-lspconfig").setup_handlers({ -- Default handler for all servers
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities
            })
        end})
    end
}}
