syntax on

" standard settings
set nu
set relativenumber

set incsearch
set hlsearch

set splitright
set splitbelow

set completeopt=menuone,longest
set shortmess+=c

set nowrap
set noerrorbells

set wildmenu
set path+=**

set scrolloff=8
set signcolumn=yes
set colorcolumn=80
hi ColorColumn ctermbg=0 guibg=lightgrey

set clipboard=unnamed,unnamedplus

" tab settings
set autoindent
set smartindent

set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4

" Plugins 
call plug#begin()

Plug 'airblade/vim-gitgutter'    " git diff in doc
Plug 'arcticicestudio/nord-vim'  " theme
Plug 'dense-analysis/ale'        " linter 
Plug 'junegunn/fzf'              " fuzzy finder
Plug 'junegunn/fzf.vim'          " fuzzy finder added functionally 
Plug 'morhetz/gruvbox'           " theme
Plug 'neoclide/coc.nvim'         " autocomplete 
Plug 'speshak/vim-cfn'           " cloudformation linter 
Plug 'preservim/nerdtree'        " file view
Plug 'vim-airline/vim-airline'   " status bar

call plug#end()

" key mapping for nerdtree, fuzzy finder, and terminal
let mapleader = " "
nnoremap <leader>f :Files .<CR>
nnoremap <leader>n :e .<CR>
nnoremap <leader>b :NERDTree .<CR>
nnoremap <leader>v :vert term<CR>
nnoremap <leader>s :term<CR>
nnoremap <leader>t :tab:term<CR>

" colour scheme 

" makes comments readable using nord for windows
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" if (has("termguicolors"))
"     set termguicolors
" endif

" colorscheme nord

colorscheme gruvbox
set bg=dark
hi Normal guibg=NONE ctermbg=NONE

