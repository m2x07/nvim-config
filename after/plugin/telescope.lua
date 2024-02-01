local map = vim.keymap.set
local builtin = require("telescope.builtin")
map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
map("n", "<leader>fc", builtin.colorscheme, { desc = "Change colorscheme" })
map("n", "<leader>ff", builtin.find_files, { desc = "Find files in the project" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep in the project" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Search and view help tags" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Search and view keymaps" })
