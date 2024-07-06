return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = "BufReadPre",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      -- NOTE: Do not configure linting for javascript/typescript or any
      -- other project, which involves using node. use the npm package for
      -- eslint instead
      -- lua = { "luacheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set(
      "n",
      "<leader>l",
      lint.try_lint,
      { desc = "Trigger linting for document/selection" }
    )
  end,
}
