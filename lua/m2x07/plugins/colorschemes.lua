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
		"rockyzhang24/arctic.nvim",
		branch = "v2",
		dependencies = { "rktjmp/lush.nvim" },
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
	{ "EdenEast/nightfox.nvim" }, -- lazy
	{ "titanzero/zephyrium" },
}
