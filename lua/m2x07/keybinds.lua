local map = vim.keymap.set

-- sample default opts
local opts = {
  silent = true,
  noremap = true,
}

-- write document to disk
map("n", "<leader>ww", "<cmd>write<CR>", {
  silent = false,
  noremap = true,
  desc = "[W]rite file to disk",
})

-- center window while navigating through search
map("n", "n", "nzz", {
  silent = true,
  noremap = true,
})

-- move selection down
map("x", "<A-K>", ":move '<-2<cr>gv-gv", {
  silent = true,
  noremap = true,
  desc = "Move selection up 1 line",
})

-- move selection up
map("x", "<A-J>", ":move '>+1<cr>gv-gv", {
  silent = true,
  noremap = true,
  desc = "Move selection down 1 line",
})

-- change to normal from terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", {
  silent = true,
  noremap = true,
  desc = "Get out of terminal mode",
})

-- clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  silent = true,
  noremap = true,
})

-- open lazy's (plugin manager) window
map("n", "<leader>L", vim.cmd.Lazy, {
  silent = true,
  noremap = true,
  desc = "Open [L]azy.nvim window",
})

-- lsp stuff
map(
  "n",
  "[d",
  vim.diagnostic.goto_prev,
  { desc = "Go to previous [D]iagnostic message" }
)
map(
  "n",
  "]d",
  vim.diagnostic.goto_next,
  { desc = "Go to next [D]iagnostic message" }
)
map(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror message" }
)
map(
  "n",
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uick-fix list" }
)

-- split window management -- 'desc' key is the description of each keybind
map("n", "<leader>sv", "<C-w>v", { desc = "Open a vertical split" })
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Open a horizontal split" })
map("n", "<C-h>", "<C-w>h", { desc = "Shift focus towards Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Shift focus towards Right" })
map("n", "<C-k>", "<C-w>k", { desc = "Shift focus towards Top" })
map("n", "<C-l>", "<C-w>l", { desc = "Shift focus towards Bottom" })
map(
  "n",
  "<C-Left>",
  ":vertical resize -2<cr>",
  { desc = "Decrease horizontal split width" }
)
map(
  "n",
  "<C-Right>",
  ":vertical resize +2<cr>",
  { desc = "Increase horizontal split width" }
)
map(
  "n",
  "<C-Up>",
  ":resize -2<cr>",
  { desc = "Increase vertical split height" }
)
map(
  "n",
  "<C-Down>",
  ":resize +2<cr>",
  { desc = "Decrease vertical split height" }
)

-- yank/paste to system clipbaord
map("v", "<localleader>y", '"+y', { desc = "Copy to system cipbaord" })
map(
  "n",
  "<localleader>p",
  '"+p',
  { desc = "Paste after cursor, from system clipboard " }
)
map(
  "n",
  "<localleader>P",
  '"+P',
  { desc = "Paste before cursor, from system clipboard " }
)
