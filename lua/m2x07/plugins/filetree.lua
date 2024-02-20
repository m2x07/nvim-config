return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			width = 40,
		},
		actions = {
			expand_all = {
				exclude = { ".git", ".node_modules" },
			},
			open_file = {
				quit_on_open = true,
			},
		},
	},
}
