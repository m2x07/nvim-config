local map = vim.keymap.set
local o = vim.tbl_deep_extend

local opts = {
	silent = true,
	noremap = true,
}

-- Better split window creation
map("n", "<leader>sv", "<C-w>v", o("force", opts, { desc = "Split window vertically" }))
map("n", "<leader>sh", "<C-w>s", o("force", opts, { desc = "Split window horizontally" }))

-- Better split-window navigation
map("n", "<C-h>", "<C-w>h", o("force", opts, { desc = "Shift focus towards Left" }))
map("n", "<C-j>", "<C-w>j", o("force", opts, { desc = "Shift focus towards Bottom" }))
map("n", "<C-k>", "<C-w>k", o("force", opts, { desc = "Shift focus towards Top" }))
map("n", "<C-l>", "<C-w>l", o("force", opts, { desc = "Shift focus towards Right" }))

-- Better split-window resizing
map("n", "<C-Up>", ":resize +2<cr>", o("force", opts, { desc = "Increase vertical split height" }))
map("n", "<C-Down>", ":resize -2<cr>", o("force", opts, { desc = "Decrease vertical split height" }))
map("n", "<C-Left>", ":vertical resize +2<cr>", o("force", opts, { desc = "Increase horizontal split width" }))
map("n", "<C-Right>", ":vertical resize -2<cr>", o("force", opts, { desc = "Decrease horizontal split width" }))

-- Center search results
map("n", "n", "nzz", o("force", opts, { desc = "Go to next match" }))
map("n", "N", "Nzz", o("force", opts, { desc = "Go to previous match" }))

-- Preserve select on indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selected lines up/down
map("x", "<A-K>", ":move '<-2<cr>gv-gv", o("force", opts, { desc = "Move selection UP by one line" }))
map("x", "<A-J>", ":move '>+1<cr>gv-gv", o("force", opts, { desc = "Move selection DOWN by one line" }))

-- Document related keybinds
map("n", "<leader>ds", ":w<cr>", o("force", opts, { desc = "Save Document" }))
map("n", "<leader>dq", ":q<cr>", o("force", opts, { desc = "Quit Document" }))

-- Better system clipboard support
map("v", "<leader>y", '"+y', o("force", opts, { desc = "Copy to system clipboard" }))
map("v", "<leader>p", '"+p', o("force", opts, { desc = "Paste from system clipboard after cursor" }))
map("v", "<leader>P", '"+P', o("force", opts, { desc = "Paste from system clipboard before cursor" }))

-- Open lazy window
map("n", "<leader>L", vim.cmd.Lazy, o("force", opts, { desc = "Open Lazy window" }))
