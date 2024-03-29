-- Leader and key mappings
vim.g.mapleader = ' '

-- Standard key mappings
vim.keymap.set('n', '-', ':Ex<CR>')
vim.keymap.set('n', '<leader>s', function() vim.o.spell = not vim.o.spell end)
vim.keymap.set('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]])
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessioniser<CR>')

-- fzf key mappings
vim.keymap.set('n', '<leader>g', ':Rg<CR>')
vim.keymap.set('n', '<leader>f', ':GFiles<CR>')
vim.keymap.set('n', 'ff', ':Files<CR>')
vim.keymap.set('n', 'gs', ':GFiles?<CR>')

-- Git key mappings vim-fugitive
vim.keymap.set('n', 'ga', ':Git add -A <CR>')
vim.keymap.set('n', 'gc', ':Git commit <CR>')
vim.keymap.set('n', 'gp', ':Git push <CR>')

-- Configure key mappings for LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

-- Disable vimwiki keymappings and enable a select few
vim.g.vimwiki_key_mappings = {all_maps = 0}
vim.keymap.set('n', '<enter>', '<Plug>VimwikiFollowLink')
vim.keymap.set('n', '<Tab>', '<Plug>VimwikiNextLink')
vim.keymap.set('n', '<S-Tab>', '<Plug>VimwikiPrevLink')
