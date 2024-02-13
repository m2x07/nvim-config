-- Configure themes here, set at the end of the file

require("onedark").setup({
	style = "darker", -- "darker" or "deep"
})
require("tokyonight").setup({
	style = "deep",
	styles = {
		keywords = { italic = false },
	},
})
require("ronny").setup()

require("cyberdream").setup({
	-- Recommended - see "Configuring" below for more config options
	transparent = true,
	italic_comments = true,
	hide_fillchars = true,
	borderless_telescope = false,
})

vim.cmd.colorscheme("onedark")
