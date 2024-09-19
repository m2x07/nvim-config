return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
  opts = {
    -- settings = {
    --   expose_as_code_action = "all"
    -- }
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
  },
}
