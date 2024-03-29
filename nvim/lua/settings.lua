-- Cursor setting
vim.opt.guicursor = ''

-- Standard settings
vim.g.netrw_banner = 0
vim.o.scrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.colorcolumn = '80'
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.shortmess:append('I')
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Enable Copilot for markdown
vim.g.copilot_filetypes = {markdown = true}

-- Set vimwiki settings
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
    {path = '~/Documents/repos/wiki', syntax = 'markdown', ext = '.md'}
}
