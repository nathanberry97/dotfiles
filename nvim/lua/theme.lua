-- colour scheme
vim.opt = 'dark'
vim.cmd('autocmd ColorScheme * hi Normal ctermbg=none')
vim.cmd('colorscheme gruvbox')

-- setup lualine
require('lualine').setup()

-- show tabline
vim.o.showtabline = 2
