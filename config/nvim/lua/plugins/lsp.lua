return {
  'neovim/nvim-lspconfig',
  version = 'v2.5.0',
  dependencies = {
    { 'williamboman/mason.nvim',           version = 'v2.1.0' },
    { 'williamboman/mason-lspconfig.nvim', version = 'v2.1.0' },
  },
  config = function()
    require('mason').setup()

    local servers = {
      'bashls', 'cssls', 'dockerls', 'eslint', 'gopls',
      'html', 'lua_ls', 'pyright', 'terraformls', 'tflint', 'ts_ls'
    }

    local on_attach = function(client, bufnr)
      if client.name == 'ts_ls' or client.name == 'html' then
        client.server_capabilities.documentFormattingProvider = false
      end

      if client.name == 'eslint' then
        client.server_capabilities.documentFormattingProvider = true
      end
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup({
      ensure_installed = servers,
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      }
    })

    local fmt_group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = fmt_group,
      callback = function()
        vim.cmd('silent! EslintFixAll')
        vim.lsp.buf.format({ async = false })
      end
    })

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  end
}
