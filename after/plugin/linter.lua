require('lint').linters_by_ft = {
    javascript = { 'eslint', 'eslint_d' },
    typescript = { 'eslint', 'eslint_d' },
    lua = { 'luacheck' }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
