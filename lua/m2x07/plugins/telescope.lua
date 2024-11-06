return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    local my_borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
    -- start telescope
    require("telescope").setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
    map("n", "<leader>tm", builtin.help_tags, { desc = "[T]elescope [M]anual" })
    map("n", "<leader>tk", builtin.keymaps, { desc = "[T]elescope [K]eybinds" })
    map("n", "<leader>tf", findfiles, { desc = "[T]elescope [F]iles" })
    map(
      "n",
      "<leader>tw",
      builtin.grep_string,
      { desc = "[T]elescope current [W]ord" }
    )
    map("n", "<leader>tg", builtin.live_grep, { desc = "[T]elescope by [G]rep" })
    map(
      "n",
      "<leader>tr",
      builtin.diagnostics,
      { desc = "[T]elescope [D]iagnostics" }
    )
    map(
      "n",
      "<leader>tb",
      builtin.buffers,
      { desc = "[T]elescope existing [B]uffers" }
    )
    map(
      "n",
      "<leader>tc",
      -- builtin.colorscheme,
      function()
        builtin.colorscheme(require("telescope.themes").get_dropdown({
          borderchars = my_borderchars,
          layout_config = {
            width = 0.3,
            height = 0.2,
          },
          -- this option 'previews' the theme as soon as it is highlighted
          enable_preview = true,
          -- while this disables the telescope's preview pane, or view
          previewer = false,
        }))
      end,
      { desc = "[T]elescope [C]olorschemes" }
    )

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({
          borderchars = my_borderchars,
          winblend = 10,
          previewer = false,
        })
      )
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
