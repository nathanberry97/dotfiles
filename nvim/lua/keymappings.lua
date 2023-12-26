-- Leader and key mappings
vim.g.mapleader = ' '

-- Standard key mappings
vim.keymap.set('n', '<leader>n', ':Ex<CR>')
vim.keymap.set('n', '<leader>s', function() vim.o.spell = not vim.o.spell end)
vim.keymap.set('n', '<leader>t', ':tabedit .<CR>')

-- fzf key mappings
vim.keymap.set('n', '<leader>g', ':Ag .<CR>')
vim.keymap.set('n', '<leader>f', ':Files .<CR>')

-- Configure key mappings for LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

-- Git key mappings vim-fugitive
vim.keymap.set('n', 'gs', ':Git status <CR>')
vim.keymap.set('n', 'ga', ':Git add -A <CR>')
vim.keymap.set('n', 'gc', ':Git commit <CR>')

-- Search and replace
vim.keymap.set('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]])
