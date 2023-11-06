-- leader and keymappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>f', ':Files .<CR>')
vim.keymap.set('n', '<leader>g', ':Ag .<CR>')
vim.keymap.set('n', '<leader>n', ':Ex<CR>')
vim.keymap.set('n', '<leader>d', ':call CocActionAsync("jumpDefinition") <CR>')
vim.keymap.set('n', '<leader>s', function()
  vim.o.spell = not vim.o.spell
end)
-- Tab settings
vim.keymap.set('n', '<leader>t', ':tabedit .<CR>')
vim.keymap.set('n', '<leader>w', ':W <CR>')
vim.keymap.set('n', '<leader><Tab>', function()

  local tabSetting = vim.o.showtabline

  if tabSetting == 0 then
      vim.o.showtabline = 2
  else
      vim.o.showtabline = 0
  end

end
)
