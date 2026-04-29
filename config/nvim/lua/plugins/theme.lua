return {
    'zenbones-theme/zenbones.nvim',
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Load colorscheme
        vim.cmd.colorscheme('zenwritten')

        -- Transparent background
        vim.cmd [[
            hi Normal guibg=NONE ctermbg=NONE
            hi NormalNC guibg=NONE ctermbg=NONE
            hi EndOfBuffer guibg=NONE ctermbg=NONE
        ]]
    end
}
