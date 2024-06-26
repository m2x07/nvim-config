local opt = vim.opt

-- Editor Settings
opt.number = true
opt.relativenumber = true
opt.scrolloff = 16
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cursorline = true
vim.g.editorconfig = true

-- Editing Settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
-- vim.cmd("set clipboard+=unnamedplus")

-- Split Magement
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- History Settings
opt.undofile = true
opt.swapfile = false
opt.history = 100

-- Misc
opt.mouse = "a"
vim.go.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.hidden = true

-- disable language providers (plugins using this langauge wont work)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
