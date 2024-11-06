return {
  "rebelot/kanagawa.nvim",
  {
    "yashguptaz/calvera-dark.nvim",
    config = function()
      vim.g.calvera_italic_comments = true
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
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
    opts = {
      italic_comments = true,
      underline_links = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require("tokyonight").setup({
        style = "night",
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          dim_inactive = true,
        },
      })
    end,
  },
}
