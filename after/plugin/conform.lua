require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        html = { { 'prettier', 'prettier_d' } },
        css = { { 'prettier', 'prettier_d' } },
        javascript = { { 'prettier', 'prettier_d' } },
        typescript = { { 'prettier', 'prettier_d' } },
        markdown = { { 'prettier', 'prettier_d' } },
    }
})

vim.keymap.set({ 'n', 'v' }, '<leader>df', function()
    require('conform').format({
        lsp_fallback = true,
    })
end, { desc = "Format code" })
