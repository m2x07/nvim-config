local map = vim.keymap.set
local builtin = require("telescope.builtin")
local telescope = require("telescope")

function myfind()
	builtin.find_files({ hidden = true })
end

map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
map("n", "<leader>fc", builtin.colorscheme, { desc = "Change colorscheme" })
map("n", "<leader>ff", myfind, { desc = "Find files in the project" })
map("n", "<leader>fl", builtin.live_grep, { desc = "Live grep in the project" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Search and view help tags" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Search and view keymaps" })
map("n", "<leader>fg", builtin.git_status, { desc = "View git files diff" })
telescope.setup({
	defaults = {
		file_ignore_patterns = {
			-- "node_modules",
			".git",
		},
	},
})
