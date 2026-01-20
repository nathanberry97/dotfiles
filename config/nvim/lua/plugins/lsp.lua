return {
  'neovim/nvim-lspconfig',
  version = 'v2.5.0',
  dependencies = {
    {
      'williamboman/mason.nvim',
      version = 'v2.1.0'
    },
    {
      'williamboman/mason-lspconfig.nvim',
      version = 'v2.1.0'
    }
  },
  config = function()
    -- Define LSPs to install and configure
    local lsps = {
      { require('lspconfig').bashls,      'bashls' },
      { require('lspconfig').cssls,       'cssls' },
      { require('lspconfig').dockerls,    'dockerls' },
      { require('lspconfig').eslint,      'eslint' },
      { require('lspconfig').gopls,       'gopls' },
      { require('lspconfig').html,        'html' },
      { require('lspconfig').lua_ls,      'lua_ls' },
      { require('lspconfig').pyright,     'pyright' },
      { require('lspconfig').terraformls, 'terraformls' },
      { require('lspconfig').tflint,      'tflint' },
      { require('lspconfig').ts_ls,       'ts_ls' }
    }
    local lspToConfigure = {}
    local lspToInstall = {}

    for i = 1, #lsps do
      table.insert(lspToConfigure, lsps[i][1])
      table.insert(lspToInstall, lsps[i][2])
    end

    -- Configure Mason
    require('mason').setup()
    require('mason-lspconfig').setup({ ensure_installed = lspToInstall })

    -- 2. Define on_attach to manage formatter conflicts
    local on_attach = function(client, bufnr)
      -- Disable native formatting for TS and HTML so ESLint takes priority
      -- (Matches your VS Code "[javascript]: { editor.defaultFormatter... }")
      if client.name == 'ts_ls' or client.name == 'html' then
        client.server_capabilities.documentFormattingProvider = false
      end

      -- Ensure ESLint is recognized as a formatter
      if client.name == 'eslint' then
        client.server_capabilities.documentFormattingProvider = true
      end
    end

    -- Configure LSPs for neovim
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for i = 1, #lspToConfigure do
      lspToConfigure[i].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    -- 3. Updated Format on save logic
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        -- If ESLint is attached, run its "Fix All" command (like VS Code source.fixAll)
        -- silent! prevents errors if the command doesn't exist in a buffer
        vim.cmd('silent! EslintFixAll')

        -- Then run standard formatting (which now uses ESLint because we disabled ts_ls)
        vim.lsp.buf.format({ async = false })
      end
    })

    -- Configure key mappings for LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  end
}
