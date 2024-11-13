return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  keys = { "<F5>", "<leader>b", "<leader>B" },
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    -- local dap, dapui = require("dap"), require("dapui")
    local dap = require("dap")
    local dapui = require("dapui")
    local mason, mason_dap = require("mason"), require("mason-nvim-dap")
    local adapters = require("m2x07.plugins.debugging.adapters")
    local configuration = require("m2x07.plugins.debugging.config")
    dapui.setup()

    mason.setup()
    mason_dap.setup({
      -- try to use your system's package manager whenever possible
      -- if you don't have one, you are probably on windows, sucks doesn't it?
      ensure_installed = {
        "node2",
      },
      automatic_install = true,
    })

    -- this plugin handles adapters and configuration for go debugging
    -- make sure to have 'dlv' inside your PATH
    require("dap-go").setup()

    -- not to confuse with Plugin.setup()
    adapters.setup(dap)
    configuration.setup(dap)

    -- BIG RED DOT
    vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

    -- debugging keymaps
    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end, { desc = "Debug: Start/Resume" })
    vim.keymap.set("n", "<F10>", function()
      dap.step_over()
    end, { desc = "Debug: Step over" })
    vim.keymap.set("n", "<F11>", function()
      dap.step_into()
    end, { desc = "Debug: Step into" })
    vim.keymap.set("n", "<F12>", function()
      dap.step_out()
    end, { desc = "Debug: Step out" })
    vim.keymap.set("n", "<leader>b", function()
      dap.toggle_breakpoint()
    end, { desc = "Debug: Toggle breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint()
    end, { desc = "Debug: Set breakpoint" })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Debug: Set log point" })
    vim.keymap.set("n", "<leader>dr", function()
      dap.repl.open()
    end, { desc = "Debug: Start REPL session" })
    vim.keymap.set("n", "<leader>dl", function()
      dap.run_last()
    end, { desc = "Debug: dap.run_last()" })
    vim.keymap.set({ "n", "v" }, "<leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "Debug: require('dap.ui.widgets').hover()" })
    vim.keymap.set({ "n", "v" }, "<leader>dp", function()
      require("dap.ui.widgets").preview()
    end, { desc = "Debug: require('dap.ui.widgets').preview()" })
    vim.keymap.set("n", "<leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end)

    -- open dapui whenever dap starts
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
