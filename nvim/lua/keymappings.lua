-- leader and keymappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>b', ':NERDTree .<CR>')
vim.keymap.set('n', '<leader>f', ':Files .<CR>')
vim.keymap.set('n', '<leader>n', ':e .<CR>')
vim.keymap.set('n', '<leader>s', function()
  vim.o.spell = not vim.o.spell
end)
-- tab settings
vim.keymap.set('n', '<leader>t', ':tabedit .<CR>')
vim.keymap.set('n', '<leader><Tab>', ':tabNext<CR>')
