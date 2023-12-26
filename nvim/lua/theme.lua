-- colour scheme
vim.cmd('autocmd ColorScheme * hi Normal ctermbg=none')
vim.cmd('colorscheme gruvbox')

-- Sign column colours
vim.cmd('hi SignColumn guibg=none ctermbg=none')

-- Tab colours
vim.cmd('hi TabLineFill guifg=8 guibg=none ctermfg=8 ctermbg=none')
vim.cmd('hi TabLineSel ctermfg=13 ctermbg=none')

-- hide status bar and show tabline
vim.o.laststatus = 0
vim.o.showtabline = 2

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
