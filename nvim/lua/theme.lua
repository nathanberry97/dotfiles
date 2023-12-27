-- hide status bar
vim.o.laststatus = 0

-- colour scheme
vim.cmd('autocmd ColorScheme * hi Normal ctermbg=none')
vim.cmd('colorscheme gruvbox')

-- Sign column colours
vim.cmd('hi SignColumn guibg=none ctermbg=none')

-- Disable GitGutter SignColumn colour
local gitGutter = {
    'GitGutterChange',
    'GitGutterAdd',
    'GitGutterDelete',
    'GitGutterChangeDelete',
}

for i = 1, #gitGutter do
    vim.cmd(string.format('hi %s guibg=none', gitGutter[i]))
end

-- Setup dumbtab configuration
require('dumbtab').setup({})
