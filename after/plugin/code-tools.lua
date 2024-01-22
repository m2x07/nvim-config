-- SETUP SMALL PLUGINS HERES

-- Automatically close brackets upon opening
require("nvim-autopairs").setup({
	check_ts = true,
	disable_filetyp = { "TelescopePrompt", "vim" },
	enable_check_bracket_line = true,
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Highlight colors in CSS & similar files
require("colorizer").setup({
	"*",
	html = {
		names = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		RRGGBBAA = true,
	},
	css = {
		names = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		RRGGBBAA = true,
	},
	javascript = {
		names = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		RRGGBBAA = true,
	},
	user_default_options = {
		tailwind = true,
	},
})

-- Plugin for easier commenting
require("Comment").setup()

-- Highlight indents in lines
require("ibl").setup({
	indent = {
		char = "▏",
	},
	exclude = {
		filetypes = { "dashboard" },
		buftypes = { "terminal" },
	},
})
