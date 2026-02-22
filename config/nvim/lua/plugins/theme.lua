return {
    'morhetz/gruvbox',
    config = function()
        -- Gruvbox settings
        vim.g.gruvbox_contrast_dark = 'medium'
        vim.g.gruvbox_italic = 1
        vim.g.gruvbox_transparent_bg = 1

        -- Load colorscheme
        vim.cmd.colorscheme('gruvbox')

        -- Transparent background
        vim.cmd [[
            hi Normal guibg=NONE ctermbg=NONE
            hi NormalNC guibg=NONE ctermbg=NONE
            hi EndOfBuffer guibg=NONE ctermbg=NONE
        ]]

        -- Tabline styling
        vim.cmd [[
            hi TabLineSel guifg=pink guibg=NONE
            hi TabLine guifg=NONE guibg=NONE
            hi TabLineFill guibg=NONE
        ]]
    end
}
