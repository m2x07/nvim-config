local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "m2x07.plugins" },
    { import = "m2x07.plugins.extra.typescript" },
  },
  install = {
    missing = true,
    colorscheme = { "tokyonight" },
  },
  ui = {
    icons = {
      loaded = "󰸞",
      not_loaded = "",
    },
  },
})
