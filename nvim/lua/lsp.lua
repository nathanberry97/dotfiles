-- Define LSPs to install and configure
local LSPS_TO_INSTALL = {
    'lua_ls',
    'gopls',
    'pyright',
    'tsserver',
    'html',
    'cssls',
}
local LSPS_TO_CONFIGURE = {
    require('lspconfig').lua_ls,
    require('lspconfig').gopls,
    require('lspconfig').pyright,
    require('lspconfig').tsserver,
    require('lspconfig').html,
    require('lspconfig').cssls,
}

-- Configure Mason
require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = LSPS_TO_INSTALL })

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

-- Configure LSPs for neovim
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for i = 1, #LSPS_TO_CONFIGURE do
    if LSPS_TO_CONFIGURE[i] == require('lspconfig').lua_ls then
        LSPS_TO_CONFIGURE[i].setup({
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
        })
    else
        LSPS_TO_CONFIGURE[i].setup({
            capabilities = capabilities
        })
    end
end
