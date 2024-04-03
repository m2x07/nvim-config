return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	keys = {
		{
			"<leader><F4>",
			function()
				vim.cmd("NvimTreeToggle")
			end,
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			width = 30,
		},
		actions = {
			expand_all = {
				exclude = { ".git", ".node_modules", "node_modules" },
			},
			open_file = {
				quit_on_open = true,
			},
		},
	},
}
