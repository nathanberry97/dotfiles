return {
    'junegunn/fzf.vim',
    dependencies = {
        'junegunn/fzf',
        dir = '~/.local/share/nvim/lazy/fzf',
        build = './install --all',
        version = '0.65.2'
    },
    config = function()
        -- fzf key mappings
        vim.keymap.set('n', '<leader>g', ':Rg<CR>')
        vim.keymap.set('n', '<leader>f', ':GFiles<CR>')
        vim.keymap.set('n', 'ff', ':Files<CR>')
        vim.keymap.set('n', 'gs', ':GFiles?<CR>')
    end
}
