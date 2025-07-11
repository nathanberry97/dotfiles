return {
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup({
            flavour = 'macchiato',
            custom_highlights = function(colors)
                return { TabLineSel = { fg = colors.blue } }
            end
        })
        vim.cmd.colorscheme 'catppuccin'
    end
}
