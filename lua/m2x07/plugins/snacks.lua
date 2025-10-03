return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- -@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      width = 45,
    },
    gitbrowser = { enabled = true },
    indent = {
      enabled = true,
      animate = { enabled = false },
    },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      style = "fancy",
    },
    notify = {
      enabled = true,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    zen = {
      enabled = true,
      toggles = {
        dim = false,
      },
      zoom = {
        win = {
          backdrop = true,
          width = 0,
        },
      },
    },
    styles = {
      notification = {
        border = "single",
      },
      zen = {
        backdrop = { blend = 30 },
      },
    },
  },
  keys = {
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>sn",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show notifications history"
    }
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    vim.api.nvim_create_user_command("Zenmode", function()
      Snacks.zen()
    end, { desc = "Toggle Zen mode (snacks.nvim)" })
    vim.api.nvim_create_user_command("Zenzoom", function()
      Snacks.zen.zoom()
    end, { desc = "Toggle Zen zoom mode (snacks.nvim)" })
  end,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          ---@diagnostic disable-next-line: duplicate-set-field
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle
          .option(
            "conceallevel",
            { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }
          )
          :map("<leader>uc")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
