return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {
      italic_comments = false,
      underline_links = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {
      style = "darker",
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {
      no_italic = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "night",
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    config = true,
    opts = {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      dim_inactive = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false,
        },
      })
    end,
  },
  { "kepano/flexoki-neovim", name = "flexoki" },
  { "thepogsupreme/mountain.nvim" },
}
