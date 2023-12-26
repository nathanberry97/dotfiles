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
