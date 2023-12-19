-- colour scheme
vim.cmd('autocmd ColorScheme * hi Normal ctermbg=none')
vim.cmd('colorscheme gruvbox')

-- Sign column colours
vim.cmd('hi SignColumn guibg=none ctermbg=none')
vim.cmd('hi GitGutterAdd guibg=none')
vim.cmd('hi GitGutterChange guibg=none')
vim.cmd('hi GitGutterDelete guibg=none')
vim.cmd('hi CocWarningSign guibg=none')
vim.cmd('hi CocErrorSign guibg=none')

-- Tab colours
vim.cmd('hi TabLineFill guifg=8 guibg=none ctermfg=8 ctermbg=none')
vim.cmd('hi TabLineSel ctermfg=4 ctermbg=none')

-- hide status bar and show tabline
vim.o.laststatus = 0
vim.o.showtabline = 2
