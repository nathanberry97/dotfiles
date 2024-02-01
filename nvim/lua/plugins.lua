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
    -- The following plugins are for my side bar
    'airblade/vim-gitgutter',
    'dense-analysis/ale',

    -- The following plugin is for note taking
    'vimwiki/vimwiki',

    -- The following plugins are for fuzz finding
    -- Ensure you have https://github.com/BurntSushi/ripgrep installed
    {
        'junegunn/fzf',
        dir = '~/.local/share/nvim/lazy/fzf',
        build = './install --all'
    },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',

    -- The following plugins are for my theme
    'morhetz/gruvbox',
    'catppuccin/nvim',

    -- The following plugin is for managing buffers and tabs
    'nathanberry97/dumbtab.nvim',

    -- The following plugin is to allow smart pane switching with tmux
    'christoomey/vim-tmux-navigator',

    -- The following plugins is for LSPs
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- The following plugins are for auto-completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- The following plugin for integrated git support
    'tpope/vim-fugitive',

    -- The following plugin is for github copliot
    'github/copilot.vim',
}

local opts = {}

require('lazy').setup(plugins, opts)
