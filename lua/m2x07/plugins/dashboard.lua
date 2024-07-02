return {
    "nvimdev/dashboard-nvim",
    lazy = false,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
        local headers = require("m2x07.headers")
        local db = require("dashboard")
        local conf = {}

        conf.header = headers.nvim
        conf.disable_move = true
        conf.center = {
            {
                icon = "  ",
                icon_hl = "Title",
                desc = "New File                    ",
                desc_hl = "Title",
                key = "n",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "enew",
            },
            {
                icon = "󰍉  ",
                icon_hl = "Title",
                desc = "Find Files                  ",
                desc_hl = "Title",
                key = "f",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "Telescope find_files hidden=true",
            },
            {
                icon = "󰈞  ",
                icon_hl = "Title",
                desc = "Find by Grep                ",
                desc_hl = "Title",
                key = "g",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "Telescope live_grep",
            },
            {
                icon = "󰋖  ",
                icon_hl = "Title",
                desc = "Find Help                   ",
                desc_hl = "Title",
                key = "h",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "Telescope help_tags",
            },
            {
                icon = "󰒓  ",
                icon_hl = "Title",
                desc = "Open Config                 ",
                desc_hl = "Title",
                key = "c",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "cd ~/.config/nvim | Telescope find_files",
            },
            {
                icon = "󰒲  ",
                icon_hl = "Title",
                desc = "Open Lazy",
                desc_hl = "Title",
                key = "l",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "Lazy",
            },
            {
                icon = "⏻  ",
                icon_hl = "Title",
                desc = "Quit Neovim                 ",
                desc_hl = "Title",
                key = "q",
                key_hl = "DiagnosticOk",
                key_format = "[ %s ]",
                action = "qa",
            },
        }
        conf.footer = {
            "",
            "  Welcome back, M2X07",
        }

        db.setup({
            theme = "doom",
            config = conf,
        })
    end,
}
