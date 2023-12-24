local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- The following plug in is for my side bar
    'airblade/vim-gitgutter',
    'dense-analysis/ale',

    -- The following plugin is for note taking
    'vimwiki/vimwiki',

    -- The following plugins are for fuzz finding
    'junegunn/fzf',
    'junegunn/fzf.vim',

    -- The following plugins are for my theme
    'morhetz/gruvbox',
    'mkitt/tabline.vim',

    -- The following plugin allows smart pane switching with tmux
    'christoomey/vim-tmux-navigator',

    -- The following plugin is for LSPs
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- The following plugins are for auto-completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
}

local opts = {}

require("lazy").setup(plugins, opts)
