return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      -- vim.cmd("colorscheme poimandres")
    end,
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
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
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
    opts = ...,
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
}
