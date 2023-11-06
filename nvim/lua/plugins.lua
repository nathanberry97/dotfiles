-- plugins
return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- The following plug in is for my side bar
    use 'airblade/vim-gitgutter'
    use 'dense-analysis/ale'

    -- The following plugin is for note taking
    use 'vimwiki/vimwiki'

    -- The following plugins are for fuzz finding
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- The following plugins are for my theme
    use 'morhetz/gruvbox'
    use 'mkitt/tabline.vim'

    -- The following plugin is for my lsp
    use {
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }

    -- The following plugin allows smart pane switching with tmux
    use 'christoomey/vim-tmux-navigator'

    -- The following plugin is for terraform Syntax highlighting 
    use 'hashivim/vim-terraform'

end)
