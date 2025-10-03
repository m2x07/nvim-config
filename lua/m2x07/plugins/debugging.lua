---@diagnostic disable: unused-local, missing-parameter
return {
  "mfussenegger/nvim-dap",
  lazy = true,
  event = "BufReadPost",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
    },
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "leoluz/nvim-dap-go",
  },
  -- opts = true,
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "python",
        "delve",
        "js",
        "firefox",
      },
      automatic_installation = true,
    })

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data")
            .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
    dap.adapters.firefox = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath("data")
          .. "/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js ",
      },
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        name = "Debug with Firefox",
        type = "firefox",
        request = "launch",
        reAttach = true,
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        firefoxExecutable = "/sbin/zen-browser",
      },
    }
    -- refer to this doc for more info for ts debugging
    -- INFO: https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_source-maps
    dap.configurations.typescript = dap.configurations.javascript

    -- keybinds for dapui
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Debug: Continue" })
    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, { desc = "Debug: Step over" })
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, { desc = "Debug: Step into" })
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, { desc = "Debug: Step out" })
    vim.keymap.set("n", "<Leader>b", function()
      require("dap").toggle_breakpoint()
    end, { desc = "Debug: Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>B", function()
      require("dap").set_breakpoint()
    end, { desc = "Debug: Set breakpoint" })
    vim.keymap.set("n", "<Leader>lp", function()
      require("dap").set_breakpoint(
        nil,
        nil,
        vim.fn.input("Log point message: ")
      )
    end, { desc = "Debug: Set log point message" })
    vim.keymap.set("n", "<Leader>dr", function()
      require("dap").repl.open()
    end, { desc = "Debug: Open a REPL" })
    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").run_last()
    end, { desc = "Debug: Run last" })
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "Debug: Hover over widget under cursor" })
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end, { desc = "Debug: Preview widget" })
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end, { desc = "Debug: Preview widget in floating window" })
    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = "Debug: View scopes in floating window" })

    dapui.setup()
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

    require("dap-go").setup()
    require("nvim-dap-virtual-text").setup()
  end,
}
