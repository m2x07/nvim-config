vim.g.mapleader = " "
vim.g.maplocalleader = ";"

require("m2x07.options")
require("m2x07.keybinds")
require("m2x07.lazy")
require("m2x07.util")

vim.cmd.colorscheme("tokyonight")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight Text after yank",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
