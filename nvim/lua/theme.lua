-- colour scheme
vim.opt = 'dark'
vim.cmd('autocmd ColorScheme * hi Normal ctermbg=none')
vim.cmd('colorscheme gruvbox')

require('lualine').setup()
options = { theme = 'lualine.themes.gruvbox' }
