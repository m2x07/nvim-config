local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
	}
})

vim.keymap.set({ "n", "v" }, "<leader>df", function()
	conform.format({
		lsp_fallback = true,
		async = false,
	})
end, { desc = "Trigger formatting for document/selection (in visual mode)" })
