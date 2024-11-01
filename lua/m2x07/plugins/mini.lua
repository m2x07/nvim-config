return {
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobject
    -- meaning better a/i movements, like 'va(' or 'ya(' and similar
    require("mini.ai").setup()

    -- Add/delete/replace surrounding (brackets, quotes, etc)
    require("mini.surround").setup()

    -- Sweet movements with Brackets
    require("mini.bracketed").setup()
  end,
}
