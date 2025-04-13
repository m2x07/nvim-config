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
          "node_modules/",
          "^.git/",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden"
        }
      },
      pickers = {
        keymaps = {
          layout_config = {
            width = 0.6,
          },
        },
        find_files = {
          no_ignore = true,
          hidden = true,
        },
        buffers = {
          sort_mru = true,
        },
      },
    })

    -- set keybinds for telescope
    map("n", "<leader>tm", builtin.help_tags, { desc = "[T]elescope [M]anual" })
    map("n", "<leader>tk", builtin.keymaps, { desc = "[T]elescope [K]eybinds" })
    map("n", "<leader>tf", builtin.find_files, { desc = "[T]elescope [F]iles" })
    map("n", "<leader>tw", function()
      builtin.grep_string(require("telescope.themes").get_cursor({
        borderchars = my_borderchars,
        disable_coordinates = true,
        path_display = {
          shorten = { len = 1, exclude = { 1, -1 } },
        },
        word_match = "-w",
        layout_config = {
          height = 19,
          width = 165,
          preview_cutoff = 80,
          preview_width = 80,
        },
      }))
    end, { desc = "[T]elescope current [W]ord" })
    map(
      "n",
      "<leader>tg",
      builtin.live_grep,
      { desc = "[T]elescope by [G]rep" }
    )
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
    map("n", "<leader>tc", function()
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
    end, { desc = "[T]elescope [C]olorschemes" })

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
