require("tokyonight").setup({
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	styles = {
		keywords = { italic = false },
	},
})

require('github-theme').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
    }
  }
})

require('onedark').setup {
    style = 'darker'
}
vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('onedark')
-- vim.cmd.colorscheme('github_dark_default')
