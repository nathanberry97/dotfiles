local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
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
    -- Ensure you have https://github.com/ggreer/the_silver_searcher installed
    {
        'junegunn/fzf',
        dir = '~/.local/share/nvim/lazy/fzf',
        build = './install --all'
    },
    'junegunn/fzf.vim',

    -- The following plugins are for my theme
    'morhetz/gruvbox',
    'mkitt/tabline.vim',

    -- The following plugin allows smart pane switching with tmux
    'christoomey/vim-tmux-navigator',

    -- The following plugin is for LSPs
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- The following plugins are for auto-completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
}

local opts = {}

require("lazy").setup(plugins, opts)
