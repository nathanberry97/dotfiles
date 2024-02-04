-- Define LSPs to install and configure
local lsps = {
    { require('lspconfig').lua_ls, 'lua_ls' },
    { require('lspconfig').gopls, 'gopls' },
    { require('lspconfig').pyright, 'pyright' },
    { require('lspconfig').tsserver, 'tsserver' },
    { require('lspconfig').html, 'html' },
    { require('lspconfig').cssls, 'cssls' },
    { require('lspconfig').dockerls, 'dockerls' },
    { require('lspconfig').bashls, 'bashls' },
    { require('lspconfig').terraformls, 'terraformls' },
    { require('lspconfig').tflint, 'tflint' },
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

-- Setup auto-complete
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Configure LSPs for neovim
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for i = 1, #lspToConfigure do
    if lspToConfigure[i] == require('lspconfig').lua_ls then
        lspToConfigure[i].setup({
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
        })
    else
        lspToConfigure[i].setup({
            capabilities = capabilities
        })
    end
end
