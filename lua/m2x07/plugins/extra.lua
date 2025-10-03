-- extra tools and miscellaneous functions

return {
  { -- INFO: better comments
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
  { "numToStr/Comment.nvim", lazy = true, event = "BufEnter", opts = {} },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      disable_filetyp = { "TelescopePrompt", "vim" },
      enable_check_bracket_line = true,
    },
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      lazy_load = true,
      user_default_options = {
        names = true,
        name_opts = {
          uppercase = true,
        },
        css = true,
        tailwind = "both",
        tailwind_opts = {
          update_names = true,
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    opts = {},
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- enabled = false,
    opts = {
      lsp = {
        hover = {
          enabled = false,
        },
      },
      views = {
        popup = {
          border = {
            style = "single",
          },
        },
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        cmdline_input = {
          border = {
            style = "single",
          },
        },
        confirm = {
          border = {
            style = "single",
          },
        },
      },
      notify = {
        enabled = false,
        view = "notify",
      },
      presets = {
        long_message_to_split = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
