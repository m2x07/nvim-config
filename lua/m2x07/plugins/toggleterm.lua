return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<leader><F2>]],
		insert_mappings = true,
		autochdir = true,
		direction = "float",
		auto_scroll = true,
		float_opts = {
			border = "curved",
		},
	},
	config = true,
}
