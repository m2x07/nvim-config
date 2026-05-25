---@diagnostic disable: need-check-nil
return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_x = {
            {
              ---@diagnostic disable-next-line: undefined-field, deprecated
              require("noice").api.statusline.mode.get,
              ---@diagnostic disable-next-line: deprecated, undefined-field
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
            "fileformat",
            "filetype",
          },
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              filetype_names = {
                snacks_picker_list = "Explorer",
              },
              use_mode_colors = true,
            },
          },
          lualine_z = { "tabs" },
        },
      })
    end,
  },
}
