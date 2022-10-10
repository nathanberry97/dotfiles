-- plugins
return require('packer').startup(function(use)

  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter' 
    use 'dense-analysis/ale'     
    use 'junegunn/fzf'           
    use 'junegunn/fzf.vim'       
    use 'morhetz/gruvbox'
    use 'neoclide/coc.nvim'      
    use 'preservim/nerdtree'
    use 'mkitt/tabline.vim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)
