return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    },
  },
}
