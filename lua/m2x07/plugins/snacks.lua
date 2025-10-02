return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- -@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      width = 50,
    },
    gitbrowser = { enabled = true },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    lazygit = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    zen = {
      enabled = true,
      toggles = {
        dim = false,
      },
    },
  },
}
