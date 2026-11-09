-- LSP Configuration
return { -- Mason: LSP/formatter/linter installer
	{
		"mason-org/mason.nvim",
		version = "^2.0",
		cmd = "Mason",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	}, -- Mason-tool-installer: Auto-install formatters and linters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		version = "^1.0",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier", -- TypeScript/JavaScript formatter
				"eslint_d", -- TypeScript/JavaScript linter
				"shellcheck", -- Bash linter
				"shfmt", -- Bash formatter
			},
			auto_update = false,
			run_on_start = true,
		},
	}, -- Mason-lspconfig: bridges mason and lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		version = "^2.0",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			-- Auto-install these LSP servers (using lspconfig names, not Mason names)
			ensure_installed = {
				"lua_ls", -- Lua
				"pyright", -- Python
				"vtsls", -- TypeScript/JavaScript
				"bashls", -- Bash
				"jsonls", -- JSON
				"html", -- HTML
				"cssls", -- CSS
			},
		},
	}, -- nvim-lspconfig: Configure LSP servers
	{
		"neovim/nvim-lspconfig",
		version = "^2.12",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if has_cmp then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			-- Apply capabilities to all servers configured via vim.lsp.config / lspconfig
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- nil_ls (Nix): configure it, but only enable when `nil` is available.
			-- Works for Mason installs or external installs (PATH).
			vim.lsp.config("nil_ls", {
				settings = {
					["nil"] = {
						formatting = {
							command = vim.fn.executable("nixfmt") == 1 and { "nixfmt" } or nil,
						},
					},
				},
			})
			if vim.fn.executable("nil") == 1 then
				vim.lsp.enable("nil_ls")
			end

			-- Auto-enable servers installed via mason-lspconfig.
			-- Requires mason.nvim to be set up elsewhere (or add require("mason").setup()).
			local has_mlsp, mlsp = pcall(require, "mason-lspconfig")
			if has_mlsp and type(mlsp.setup) == "function" then
				mlsp.setup({
					-- recent mason-lspconfig: auto-enables installed servers via vim.lsp.enable
					automatic_enable = {
						exclude = { "nil_ls" }, -- we handle nil_ls above (external/Mason-safe)
					},
				})
			end
		end,
	},
}
