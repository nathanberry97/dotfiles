return {
    {
        'nathanberry97/dumbtab.nvim',
        event = 'VimEnter',
        config = function()
            require('dumbtab').setup()
        end
    },
    {
        'nathanberry97/dumbtree.nvim',
        config = function()
            require('dumbtree').setup()
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            -- Git key mappings vim-fugitive
            vim.keymap.set('n', 'ga', ':Git add -A <CR>')
            vim.keymap.set('n', 'gc', ':Git commit <CR>')
            vim.keymap.set('n', 'gp', ':Git push <CR>')
            vim.keymap.set('n', 'gb', ':Git blame <CR>')
        end
    },
    {
        'airblade/vim-gitgutter'
    },
    {
        'christoomey/vim-tmux-navigator'
    }
}
