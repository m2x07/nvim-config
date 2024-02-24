-- spec for all lsp and related plugins
return {
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
		event = "BufReadPre",
		branch = "v3.x",
		dependencies = {

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
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mti = require("mason-tool-installer")

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			mason.setup({
				ui = {
					icons = {
						package_installed = "󰸞",
						package_pending = "",
						package_uninstalled = "",
					},
				},
			})
			mason_lspconfig.setup({
				ensure_installed = {
					"emmet_language_server",
					"html",
					"cssls",
					"tsserver",
					"tailwindcss",
					"jsonls",
					"lua_ls",
					"yamlls",
				},
				handlers = {
					lsp_zero.default_setup,
				},
			})
			mti.setup({
				ensure_installed = {
					"stylua",
					"luacheck",
					"prettier",
					"eslint_d",
				},
				run_on_start = false,
			})

			-- AUTO COMPLETIONS
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- use friendly-snippets source
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Navigate between snippet placeholder
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = cmp.config.sources({
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
				}),
			})

			-- automatically close open parenthesis/braces/brackets/aphostrophes/etc
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
