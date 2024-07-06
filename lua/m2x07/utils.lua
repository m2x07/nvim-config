-- TODO: add funs and commands for terminal management

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight Text after yank",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
