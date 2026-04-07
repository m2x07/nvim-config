return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = true,
  event = "BufReadPre",
  -- opts = {
  --   ensure_installed = {
  --     "bash",
  --     "diff",
  --     "html",
  --     "lua",
  --     "markdown",
  --     "css",
  --     "javascript",
  --     "typescript",
  --   },
  --   sync_install = false,
  --   auto_install = true,
  --   highlight = {
  --     enable = true,
  --   },
  -- },
  -- config = function(_, opts)
  --   require("nvim-treesitter").prefer_git = true
  --   ---@diagnostic disable-next-line: missing-fields
  --   require("nvim-treesitter.configs").setup(opts)
  -- end,
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- Enable treesitter-based folding
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'
      end,
    })

    local ensureInstalled = {
      "bash", "diff", "html", "lua", "markdown", "css", "javascript",
      "typescript"
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
}
