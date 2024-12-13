return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    local headers = require("m2x07.headers")
    local function get_random_header()
      local keys = {}
      for key, _ in pairs(headers) do
        table.insert(keys, key)
      end
      local random_key = keys[math.random(1, #keys)]
      return headers[random_key]
    end

    dashboard.section.header.val = get_random_header()
    dashboard.section.buttons.val = {
      dashboard.button("n", "  Edit a New File", ":enew<CR>"),
      dashboard.button(
        "f",
        "󰍉  Find File to edit",
        ":Telescope find_files hidden=true no_ignore=true<CR>"
      ),
      dashboard.button(
        "g",
        "󰈞  Find Word (grep)",
        ":Telescope live_grep<CR>"
      ),
      dashboard.button(
        "h",
        "󰋖  Find Help (manual)",
        ":Telescope help_tags<CR>"
      ),
      dashboard.button(
        "c",
        "󰒓  Open Nvim Config",
        ":cd ~/.config/nvim | Telescope find_files hidden=true no_ignore=true<CR>"
      ),
      dashboard.button("l", "󰒲  Open Lazy.nvim", ":Lazy<CR>"),
      dashboard.button("q", "⏻  Quit NeoVim", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "Title"
    dashboard.section.footer.opts.hl = "Statement"
    dashboard.section.footer.opts.position = "center"

    dashboard.opts.layout = {
      dashboard.section.header,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true
    vim.cmd([[autocmd User AlphaReady echo 'ready']])
    return dashboard
  end,

  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
    vim.api.nvim_create_autocmd("User", {
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        dashboard.section.footer.val = "\n⚡Lazy loaded "
          .. stats.loaded
          .. " of "
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
