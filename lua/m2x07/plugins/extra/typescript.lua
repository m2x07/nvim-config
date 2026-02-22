return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
  config = function()
    require("typescript-tools").setup {
      settings = {
        -- config options to pass to tsserver can be specified here
        -- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts#L3439
        tsserver_file_preferences = {
          disableSuggestions = true
        },
        expose_as_code_action = "all",
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      }
    }
  end
}
