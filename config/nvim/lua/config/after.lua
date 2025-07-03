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
