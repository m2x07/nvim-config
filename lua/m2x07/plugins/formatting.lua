return {
  "stevearc/conform.nvim",
  lazy = true,
  event = "BufReadPost",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = function(bufnr)
    --   local disable_filetypes = { c = true, cpp = true }
    --   return {
    --     timeout_ms = 500,
    --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --   }
    -- end,
    formatters_by_ft = {
      -- NOTE: Do not configure formatting for javascript/typescript or any
      -- other project, which involves using node. use the npm package for
      -- prettier instead
      lua = { "stylua" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      json = { "prettier" }, -- INFO: json maybe used outside of node projects
    },
  },
}
