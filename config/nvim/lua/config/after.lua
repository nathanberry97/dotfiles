-- Disable column colours
vim.cmd('hi SignColumn guibg=none ctermbg=none')

-- Remove default colours for git gutter
local gitGutter = {
    'GitGutterChange',
    'GitGutterAdd',
    'GitGutterDelete',
    'GitGutterChangeDelete'
}
for i = 1, #gitGutter do
    vim.cmd(string.format('hi %s guibg=none guifg=none', gitGutter[i]))
end

-- Enable column at char 80 and set to grey
vim.opt.colorcolumn = '80'
vim.cmd([[highlight ColorColumn guibg=#333333]])
