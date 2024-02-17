-- Configure themes here, set at the end of the file

require("onedark").setup({
	style = "cool", -- "darker" or "deep" or "cool"
})
require("tokyonight").setup({
	style = "moon",
	styles = {
		keywords = { italic = false },
	},
})
require("ronny").setup()

vim.cmd.colorscheme("onedark")
