return {
	-- some Colorschemes
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "night",
			styles = {
				keywords = { italic = false },
			},
		},
	},
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "deep",
		},
	},
	{
		"Mofiqul/vscode.nvim",
		opts = {
			italic_comments = false,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
			styles = {
				bold = false,
				italic = false,
				transparency = false,
			},
		},
	},
}
