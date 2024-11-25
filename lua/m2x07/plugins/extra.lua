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
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufReadPre",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      exclude = {
        filetypes = { "dashboard" },
        buftypes = { "terminal" },
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    -- event = "BufReadPre",
    cmd = {
      "ColorizerToggle",
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffer",
    },
    opts = {
      "*",
      html = {
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        RRGGBBAA = true,
      },
      css = {
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        RRGGBBAA = true,
      },
      javascript = {
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        RRGGBBAA = true,
      },
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    }, -- if you use the mini.nvim suite
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    opts = {
      window = {
        width = 150,
      },
    },
  },
}
