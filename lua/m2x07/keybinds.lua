local map = vim.keymap.set
local unmap = vim.keymap.del

local opts = {
    silent = true,
    noremap = true
}

-- Better split window creation
map('n', '<C-v>', '<C-w>v', opts)
map('n', '<C-s>', '<C-w>s', opts)

-- Better split-window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Better split-window resizing
map('n', '<C-Up>', ':resize +2<cr>', opts)
map('n', '<C-Down>', ':resize -2<cr>', opts)
map('n', '<C-Left>', ':vertical resize +2<cr>', opts)
map('n', '<C-Right>', ':vertical resize -2<cr>', opts)

-- Center search results
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Preserve select on indent
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move selected lines up/down
map('x', '<A-K>', ":move '<-2<cr>gv-gv", opts)
map('x', '<A-J>', ":move '>+1<cr>gv-gv", opts)

-- NvimTree related maps
map({ 'n', 'i' }, '<leader><F4>', vim.cmd.NvimTreeToggle, opts)

-- Document related keybinds
map('n', '<leader>ds', ':w<cr>')


