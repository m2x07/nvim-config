require("nvim-tree").setup({
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
})
