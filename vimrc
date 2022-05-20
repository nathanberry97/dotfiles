syntax on

" standard settings
set nu
set relativenumber

set incsearch
set hlsearch

set splitright

set completeopt=menuone,longest
set shortmess+=c

set nowrap
set noerrorbells

set wildmenu
set path+=**

set scrolloff=8
set signcolumn=yes
set colorcolumn=79
hi ColorColumn ctermbg=0 guibg=lightgrey

" tab settings
set autoindent
set smartindent

set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4

" Plugins 
call plug#begin()

Plug 'airblade/vim-gitgutter'    " git diff in doc
Plug 'dense-analysis/ale'        " linter 
Plug 'junegunn/fzf'              " fuzzy finder
Plug 'junegunn/fzf.vim'          " fuzzy finder added functionally 
Plug 'morhetz/gruvbox'           " theme
Plug 'preservim/nerdtree'        " file view
Plug 'vim-airline/vim-airline'   " status bar
Plug 'vim-scripts/AutoComplPop'  " automatically shows completion menu

call plug#end()

" colour scheme 
colorscheme gruvbox
set bg=dark
hi Normal guibg=NONE ctermbg=NONE

" key mapping for nerdtree, fuzzy finder, and terminal
" the last setting is for wsl visual mode
let mapleader = " "
nnoremap <leader>f :Files .<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :vert term<CR>
nnoremap <Leader>v <c-v>
