-- nvim-lint: Code linting
return {
	"mfussenegger/nvim-lint",
	version = "^0.6",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local nix_linters = {}

		if vim.fn.executable("statix") == 1 then
			table.insert(nix_linters, "statix")
		end

		if vim.fn.executable("deadnix") == 1 then
			table.insert(nix_linters, "deadnix")
		end

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
			nix = nix_linters,
		}

		-- Auto-lint on save and text change
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
