local opt = vim.opt

-- Editor Settings
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.colorcolumn = "80"
opt.signcolumn = "auto"
opt.cursorline = true
opt.showmode = false
vim.g.editorconfig = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.inccommand = "split"
opt.ruler = false
-- vim.cmd("set clipboard+=unnamedplus")

-- Split Magement
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- History Settings
opt.undofile = true
opt.swapfile = false
opt.history = 100

-- Misc
opt.mouse = "a"
-- vim.go.termguicolors = true
opt.termguicolors = true
opt.hidden = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.updatetime = 250
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.g.background = "dark"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.o.background = "dark"
  end,
})
