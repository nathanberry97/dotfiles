return {
    'catppuccin/nvim',
    version = 'v1.11.0',
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            custom_highlights = function(colors)
                return { TabLineSel = { fg = colors.blue } }
            end
        })
        vim.cmd.colorscheme 'catppuccin'
        vim.cmd [[
            hi Normal guibg=NONE ctermbg=NONE
            hi NormalNC guibg=NONE ctermbg=NONE
            hi EndOfBuffer guibg=NONE ctermbg=NONE
        ]]
    end
}
