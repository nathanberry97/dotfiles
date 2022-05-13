syntax on

" standard settings
set nu
set relativenumber

set incsearch
set hlsearch

set completeopt=menuone,longest
set shortmess+=c

set nowrap
set noerrorbells

set wildmenu
set path+=**

set scrolloff=8
set signcolumn=yes
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" tab settings
set autoindent
set smartindent

set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4

" Plugins 
call plug#begin()

Plug 'vim-scripts/AutoComplPop'  " automatically shows completion menu
Plug 'voldikss/vim-floaterm'     " allow for the terminal to float above vim
Plug 'arcticicestudio/nord-vim'  " theme
Plug 'preservim/nerdtree'        " file view
Plug 'dense-analysis/ale'        " linter 
Plug 'vim-airline/vim-airline'   " status bar
Plug 'airblade/vim-gitgutter'    " git diff in doc
Plug 'junegunn/fzf'              " fuzzy finder
Plug 'junegunn/fzf.vim'          " fuzzy finder added functionally 

call plug#end()

" colour scheme 
colorscheme nord

" key mapping for nerdtree, fuzzy finder, and floaterm 
let mapleader = " "
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :FloatermNew<CR>
nnoremap <leader>f :Files .<CR>

" needed to reload page as when you exit out of floaterm ale linting stops working
nnoremap <leader>e :e<CR>
