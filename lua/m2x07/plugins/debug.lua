return {
	-- import dap adapters
	{ import = "m2x07.plugins.dap.javascript" },

	-- dap client
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", module = false },
		},
		lazy = true,
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
			},
		},
	},
}
