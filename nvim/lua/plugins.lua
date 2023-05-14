-- plugins
return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- The following plug in is for my side bar
    use 'airblade/vim-gitgutter'
    use 'dense-analysis/ale'

    -- The following plugins are for fuzz finding
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- The following plugin is for terraform Syntax highlighting 
    use 'hashivim/vim-terraform'

    -- The following plugins are for my theme
    use 'morhetz/gruvbox'
    use 'mkitt/tabline.vim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- The following plugin is for my lsp
    use {
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }

end)
