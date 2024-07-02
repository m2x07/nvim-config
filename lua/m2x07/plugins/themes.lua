return {
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            require('tokyonight').setup({
                style = "night",
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                }
            })
        end
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
}
