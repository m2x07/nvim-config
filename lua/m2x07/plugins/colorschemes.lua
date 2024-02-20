return {
	-- some colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			styles = {
				keywords = { italic = false },
			},
		},
	},
	{ "navarasu/onedark.nvim", opts = {
		style = "deep",
	} },
	{ "judaew/ronny.nvim", opts = {} },
}
