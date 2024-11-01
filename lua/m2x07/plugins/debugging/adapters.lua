return {
  setup = function(dap)
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath("data")
          .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
      },
    }
  end,
}
