return {
	-- extra utility tools
	-- autopairs
	-- colorizer
	-- comment
	-- ibl
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "BufReadPost",
		opts = {
			padding = true,
			sticky = true,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			disable_filetyp = { "TelescopePrompt", "vim" },
			enable_check_bracket_line = true,
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "BufReadPost",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
			},
			exclude = {
				filetypes = { "dashboard" },
				buftypes = { "terminal" },
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		event = "BufReadPost",
		opts = {
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
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
