-- Leader and key mappings
vim.g.mapleader = ' '

-- Standard key mappings
vim.keymap.set('n', '<leader>n', ':Ex<CR>')
vim.keymap.set('n', '<leader>s', function() vim.o.spell = not vim.o.spell end)

-- fzf key mappings
vim.keymap.set('n', '<leader>g', ':Ag .<CR>')
vim.keymap.set('n', '<leader>f', ':Files .<CR>')
vim.keymap.set('n', '<leader>h', ':History <CR>')
vim.keymap.set('n', '<leader>c', ':Commits <CR>')

-- Configure key mappings for LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

-- Git key mappings vim-fugitive
vim.keymap.set('n', 'gs', ':Git status <CR>')
vim.keymap.set('n', 'ga', ':Git add -A <CR>')
vim.keymap.set('n', 'gc', ':Git commit <CR>')
vim.keymap.set('n', 'gp', ':Git push <CR>')

-- Search and replace
vim.keymap.set('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]])

-- Disable vimwiki keymappings and enable a select few
vim.g.vimwiki_key_mappings = { all_maps = 0 }
vim.keymap.set('n', '<enter>', '<Plug>VimwikiFollowLink')
vim.keymap.set('n', '<Tab>', '<Plug>VimwikiNextLink')
vim.keymap.set('n', '<S-Tab>', '<Plug>VimwikiPrevLink')
vim.keymap.set('n', '<leader>ww', '<Plug>VimwikiIndex')
vim.keymap.set('n', '<leader>wt', ':tabnew<CR>:VimwikiIndex<CR>')
