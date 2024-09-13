return {
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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
}
