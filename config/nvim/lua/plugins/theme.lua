return {
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            custom_highlights = function(colors)
                return { TabLineSel = { fg = colors.pink } }
            end
        })
        vim.cmd.colorscheme 'catppuccin'
    end
}
