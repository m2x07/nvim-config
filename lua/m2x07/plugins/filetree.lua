return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  keys = {
    {
      "<leader><F4>",
      function()
        vim.cmd("NvimTreeToggle")
      end,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        git_placement = "signcolumn",
        show = {
          folder = true,
        },
      },
    },
    update_focused_file = {
      enable = true,
    },
    actions = {
      expand_all = {
        exclude = { ".git", "node_modules" },
      },
      open_file = {
        quit_on_open = true,
      },
    },
    filters = {
      git_ignored = false,
      custom = {
        "^.git$",
        "^node_modules$",
      },
    },
  },
}
