set nocompatible

nnoremap <SPACE> <Nop>
let mapleader=" "

set backspace=indent,eol,start

set number
set relativenumber

syntax enable

"attempt to determine type of file and use intelligent auto-indenting,
"combination of filetype on, filetype plugin on, filetype indent on
filetype plugin indent on

set autoindent

set expandtab
set tabstop=2
set shiftwidth=2

set mouse=a

set noundofile
set nobackup
set noswapfile

set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set laststatus=1
set belloff=all
set scrolloff=1

set hidden

"allows search (:find) down into subfolders
set path+=**

set wildmenu

set updatetime=50

nnoremap <leader>e :Explore<CR>
let g:netrw_bufsettings = 'noma nomod nowrap ro nobl'

"vim-plug settings and user specific plugins stored in /.vim/autoload
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

