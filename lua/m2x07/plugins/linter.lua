return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = "BufReadPre",
	config = function()
		local linter = require("lint")

		linter.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			lua = { "luacheck" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				linter.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>dl", function()
			linter.try_lint()
		end, { desc = "Trigger linting for document/selection (in visual mode)" })
	end,
}
