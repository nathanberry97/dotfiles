-- cursor setting
vim.opt.guicursor = ''

-- standard settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false
vim.o.scrolloff = 8

vim.opt.colorcolumn = '80'
vim.opt.signcolumn = 'yes'

vim.opt.errorbells = false
vim.opt.shortmess:append('c')

vim.o.spell = true
vim.api.nvim_set_option("clipboard","unnamed")
vim.api.nvim_set_option("clipboard","unnamedplus")

-- tab settings
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4