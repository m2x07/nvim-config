return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  -- lazy = false,
  lazy = true,
  event = "VimEnter",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  config = function()
    local headers = require("m2x07.headers")
    local db = require("dashboard")
    local conf = {}

    local function get_random_header()
      local keys = {}
      for key, _ in pairs(headers) do
        table.insert(keys, key)
      end

      local random_key = keys[math.random(1, #keys)]
      return headers[random_key]
    end
    -- conf.header = headers.animegirl2
    conf.header = get_random_header()
    conf.disable_move = true
    conf.center = {
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "New File               ",
        desc_hl = "Title",
        key = "n",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "enew",
      },
      {
        icon = "󰍉  ",
        icon_hl = "Title",
        desc = "Find Files             ",
        desc_hl = "Title",
        key = "f",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = function()
          local tl = require("telescope.builtin")
          tl.find_files({
            hidden = true,
            no_ignore = true,
          })
        end,
      },
      {
        icon = "󰈞  ",
        icon_hl = "Title",
        desc = "Find by Grep           ",
        desc_hl = "Title",
        key = "g",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "Telescope live_grep",
      },
      {
        icon = "󰋖  ",
        icon_hl = "Title",
        desc = "Find Help              ",
        desc_hl = "Title",
        key = "h",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "Telescope help_tags",
      },
      {
        icon = "󰒓  ",
        icon_hl = "Title",
        desc = "Open Config            ",
        desc_hl = "Title",
        key = "c",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "cd ~/.config/nvim | Telescope find_files",
      },
      {
        icon = "󰒲  ",
        icon_hl = "Title",
        desc = "Open Lazy",
        desc_hl = "Title",
        key = "l",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "Lazy",
      },
      {
        icon = "⏻  ",
        icon_hl = "Title",
        desc = "Quit Neovim             ",
        desc_hl = "Title",
        key = "q",
        key_hl = "Statement",
        key_format = "[ %s ]",
        action = "qa",
      },
    }
    conf.footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return {
        "  Welcome back, M2X07",
        "⚡Lazy loaded "
          .. stats.loaded
          .. " of "
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms",
      }
    end

    db.setup({
      theme = "doom",
      config = conf,
    })
  end,
}
