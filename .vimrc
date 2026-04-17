set number
set relativenumber
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set hidden
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set belloff=all
set scrolloff=1
set path+=**
set wildmode=noselect:full
set wildoptions=pum,tagfile
set completeopt+=menuone,noselect,fuzzy
set updatetime=50
set list
set listchars=tab:»\ ,trail:∘

syntax enable
filetype plugin indent on

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>e :Explore<CR>
let g:netrw_bufsettings = 'noma nomod nowrap ro nobl'

"vim-plug settings and user specific plugins stored in /.vim/autoload
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
call plug#end()

color seoul256
