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
Plug 'arcticicestudio/nord-vim'  " theme
Plug 'preservim/nerdtree'        " file view
Plug 'dense-analysis/ale'        " linter 

call plug#end()

" colour scheme 
colorscheme nord

" key mapping for nerdtree
let mapleader = " "
nnoremap <leader>n :NERDTree<CR>
