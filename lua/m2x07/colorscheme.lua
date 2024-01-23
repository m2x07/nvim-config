-- Configure themes here, set at the end of the file
require('onedark').setup {
    style = 'darker'
}
require('tokyonight').setup {
    style = "moon",
    styles = {
        keywords = { italic = false, }
    }
}
require('github-theme').setup {
    options = {
        styles = {
            comments = 'italic',
        }
    }
}
vim.g.moonlight_italic_comments = true
vim.g.moonlight_borders = true
require('rose-pine').setup({
    variant = 'main',
    dark_variant = 'main',
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    }
})

local theme = vim.cmd.colorscheme

-- theme("rose-pine")
theme("onedark")
