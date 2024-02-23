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

-- TIP: lazy window can be opened through <Leader>L. see 'keybinds.lua'

local lazyopts = {
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
}

require("lazy").setup("m2x07.plugins", lazyopts)
