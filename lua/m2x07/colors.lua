-- Configure themes here, set at the end of the file

require("onedark").setup({
	style = "darker",
})
require("tokyonight").setup({
	style = "moon",
	styles = {
		keywords = { italic = false },
	},
})
require("rose-pine").setup({
	variant = "main",
	dark_variant = "main",
	styles = {
		bold = true,
		italic = false,
		transparency = false,
	},
})

vim.g.substrata_italic_comments = true

vim.cmd.colorscheme("tokyonight-moon")
