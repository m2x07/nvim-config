return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- opts = {
    --   options = {
    --     icons_enabled = true,
    --     theme = "auto",
    --     component_separators = { left = "", right = "" },
    --     section_separators = { left = "", right = "" },
    --   },
    --   sections = {
    --     lualine_c =
    --   }
    -- },
    config = function()
      local lualine = require("lualine")

      local function get_lsp()
        local msg = "No Active LSP"
        ---@diagnostic disable-next-line: deprecated
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        ---@diagnostic disable-next-line: deprecated
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          ---@diagnostic disable-next-line: undefined-field
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          -- component_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha" },
            winbar = { "alpha" },
          },
        },
        sections = {
          lualine_x = {
            {
              get_lsp,
              icon = "",
            },
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  },
}
