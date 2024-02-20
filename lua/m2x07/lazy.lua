local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- some colorschemes
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "navarasu/onedark.nvim" },
	{ "judaew/ronny.nvim" },

	-- parser for code highlighting and stuff. VERY IMPORTANT
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- quick switching between buffers
	"ThePrimeagen/harpoon",

	-- terminal integration
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- better Commenting
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	-- indent guides
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- color highlighting
	{ "norcalli/nvim-colorizer.lua" },

	-- git integration
	"tpope/vim-fugitive",

	-- linter
	{ "mfussenegger/nvim-lint" },

	-- code formatter
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- nice and beautiful status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- awesome start screen
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- autoinstall mason packages
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			opts = {},
		},
	},
}, {
	install = {
		missing = true,
		colorscheme = { "tokyonight" },
	},
	ui = {
		icons = {
			loaded = "󰸞",
			not_loaded = "",
		},
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disable_plugins = {
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
