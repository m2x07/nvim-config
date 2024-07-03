return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  event = "BufReadPre",
  opts = {
    ensure_installed = {
      "bash",
      "diff",
      "html",
      "lua",
      "markdown",
      "css",
      "javascript",
      "typescript",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup(opts)
  end,
}
