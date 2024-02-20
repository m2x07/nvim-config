-- Configure themes here, set at the end of the file

require("onedark").setup({
	style = "deep", -- "darker" or "deep" or "cool"
})
require("tokyonight").setup({
	style = "night",
	styles = {
		keywords = { italic = false },
	},
})
require("ronny").setup()

vim.cmd.colorscheme("tokyonight")
