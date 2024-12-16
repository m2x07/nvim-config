local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

map("n", "<leader>tu", "0f[lr<Space><Esc>")
map("n", "<leader>tc", "0f[lrx<Esc>")
