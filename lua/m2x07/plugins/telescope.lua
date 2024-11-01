return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    -- start telescope
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
      },
    })

    local function findfiles()
      builtin.find_files({ hidden = true, no_ignore = true })
    end

    -- set keybinds for telescope
    map("n", "<leader>sm", builtin.help_tags, { desc = "[S]earch [M]anual" })
    map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eybinds" })
    map("n", "<leader>sf", findfiles, { desc = "[S]earch [F]iles" })
    map(
      "n",
      "<leader>ss",
      builtin.builtin,
      { desc = "[S]earch [S]elect Telescope" }
    )
    map(
      "n",
      "<leader>sw",
      builtin.grep_string,
      { desc = "[S]earch current [W]ord" }
    )
    map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    map(
      "n",
      "<leader>sr",
      builtin.diagnostics,
      { desc = "[S]earch [D]iagnostics" }
    )
    map(
      "n",
      "<leader>sb",
      builtin.buffers,
      { desc = "[S]earch existing [B]uffers" }
    )
    map(
      "n",
      "<leader>sc",
      -- builtin.colorscheme,
      function()
        builtin.colorscheme(require("telescope.themes").get_dropdown({
          width = 0.5,
        }))
      end,
      { desc = "[S]earch [C]olorschemes" }
    )

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        })
      )
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
