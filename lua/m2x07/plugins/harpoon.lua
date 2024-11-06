return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local map = vim.keymap.set
    local harpoon = require("harpoon")
    ---@diagnostic disable-next-line: missing-parameter
    harpoon.setup()

    map("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "[H]arpoon: [A]dd file" })
    map("n", "<localleader>h", function ()
      local count = vim.v.count
      if count < 0 then
        vim.notify_once("Harpoon: Negative number provided. No buffer exists here", vim.log.levels.ERROR, {})
        return
      end
      if count == 0 then
        vim.notify_once("Harpoon: No number provided. doing nothing", vim.log.levels.ERROR, {})
        return
      end
      harpoon:list():select(count)
    end, { desc = "Open [H]arpoon file (with a count)"})
    map("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open [h]arpoon [L]ist" })
  end,
}
